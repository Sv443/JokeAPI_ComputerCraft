MONITOR_SIDE = "right"
JOKE_URL     = "https://v2.jokeapi.dev/joke/Misc?safe-mode&format=txt"
INTERVAL     = 300 -- in seconds, when to display a new joke
TEXT_SCALE   = 1 -- has to be a multiple of 0.5



-- Sends an HTTP request and returns the joke text or nil if the server is down
function getJoke()
    http.request(JOKE_URL)

    while true do
        local event, url, hBody = os.pullEvent()

        if event == "http_success" then
            return hBody.readAll()
        elseif event == "http_failure" then
            return nil
        end
    end
end


-- Parses the joke, splitting it into lines and then writes those lines to the monitor
function updateMonitor(monitor)
    print("Fetching new joke...")

    monitor.clear()
    monitor.setCursorPos(1, 1)

    local rawJoke = getJoke()

    if rawJoke == nil then
        monitor.write("(JokeAPI is down)")
    else
        local joke = rawJoke:gsub("[\n\r]", " ")
        local w,h = monitor.getSize()

        local characters = {}

        for i = 1, #joke do
            local c = joke:sub(i,i)
            characters[i] = c
        end


        local writeStrings = {}
        local count = 0
        local total = 0
        local lines = 1
        local currentLine = ""

        for key,char in pairs(characters) do
            count = count + 1
            total = total + 1

            currentLine = currentLine..char

            if count == w then
                writeStrings[lines] = currentLine
                currentLine = ""

                count = 0
                lines = lines + 1
            end
        end

        if count > 0 then
            writeStrings[lines] = currentLine
        end


        for j=1, lines do
            local cLine = writeStrings[j]

            if cLine == nil then
                break
            end

            print("Writing line #"..j..": "..cLine)
            monitor.setCursorPos(1, j)
            monitor.write(cLine)
        end

        print("Done fetching joke. Waiting for "..INTERVAL.." seconds...\n\n")
    end
end


-- Call this to run the code - this function fetches jokes and updates the monitor on interval
function run()
    local monitor = peripheral.wrap(MONITOR_SIDE)
    monitor.setTextScale(TEXT_SCALE)

    while true do
        updateMonitor(monitor)
        os.sleep(INTERVAL)
    end
end


run()