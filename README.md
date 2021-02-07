<div align=`"center"` style="text-align: center">

# JokeAPI_ComputerCraft
## A ComputerCraft program that displays a joke from [JokeAPI](https://github.com/Sv443/JokeAPI) on an in-game monitor on interval

<br>

![example image](./example.png)

</div>

<br><br>

## Installation:
1. Craft a computer and at least one monitor (though 4 or more are recommended)
2. Place the monitors next to each other and make sure one of them touches the computer
3. Run this command in the computer: `pastebin get 6tnmW93j startup`
4. Run the command `edit startup`
5. Change the `MONITOR_SIDE` variable at the top to the side where your monitor(s) are connected to the computer
    - Valid side values are: `"front"`, `"back"`, `"left"`, `"right"`, `"top"` or `"bottom"`
    - The other variables can of course also be changed, like the interval at which a new joke is fetched or the text size
6. Press `Ctrl`, navigate to `Save` and press `Enter` to save your changes
7. Press `Ctrl`, navigate to `Exit` and press `Enter` to exit the editor
8. Run the command `reboot`

After these steps, the computer will enter an infinite loop. To exit it, hold down `Ctrl` and `T`.  
To edit the program, go to step 4 again.

<br><br>

### License:
This code is licensed under the [MIT license](https://sv443.net/LICENSE)
