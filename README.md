# Cheers
Happy Hour Finder CS Senior Project (COMP 495 @ USD)


## How to install + run
1. In your Xcode project, pull from `develop`.
2. Open `terminal` (`Command + Space`, then search for "terminal").
3. `cd` into the same directory as where your code for Cheers is stored.

    For example, if my code is on the Desktop, then I'll need to use `cd Desktop/Cheers`.
4. Use the following commands to install `CocoaPods`:
  
    `sudo gem install cocoapods`
    
    `pod setup`   <-- this is a big file, it may take a few minutes
    
    `pod install`
5. Once the installation has finished, quit Xcode.
6. Open Cheers in Finder. In your Cheers folder you should see two Xcode files, a blue one that ends in `.xcodeproj` and a white one that ends in `.xcworkspace`. Double click on the white `.xcworkspace` file to open the project (you'll have to use white icon from now on).
7. `Command + R` to build and run!

If you have any issues, please refer to [this helpful Stack Overflow post](https://stackoverflow.com/questions/20755044/how-to-install-cocoapods).

## How to upload to the database
Look to `BarNames.txt` for the template...
1. Start an empty `.txt` file on your local machine. For your selected neighborhood, add bars in the following format:

```
barName1
neighborhoodName
happyHour1Day1
happyHour1Time1
happyHour1Day2
happyHour1Time2
...
happyHour1DayN
happyHour1TimeN
END OF RECORD
barName2
neighborhoodName
...
happyHour2TimeN
END OF RECORD
```

For example, if I wanted to upload two bars for North Park, it would look like this:
```
Firehouse
Pacific Beach
Monday
5pm - 12am
Tuesday
5pm - 12am
Wednesday
5pm - 12am
Thursday
5pm - 2am
Friday
5pm - 10pm
Sunday
9am - 3pm
END OF RECORD
Pacific Beach Ale House
Pacific Beach
Monday
3pm - 6pm
Tuesday
3pm - 6pm
Wednesday
3pm - 6pm
Thursday
3pm - 6pm
Friday
3pm - 6pm
END OF RECORD
```

Make sure that your neighborhood matches **EXACTLY** the raw value of the `enum Neighborhood` in `Neighborhoods.swift`. If I am doing North Park, my neighborhood line in my `.txt` file needs to match "North Park" exactly -- "north park", "North park", and "northpark" will all cause errors.

2. Add the `.txt` file to your project by right-clicking on the top-level folder in your Xcode project (the folder called "Cheers") and then select "Add files to Cheers...". Then select your new `.txt` file.
3. Commit and push the file to whatever branch you're working on.
4. In the `Model` folder of the Xcode project, open the file `DatabaseRecord.swift`. Locate the function `writeToDB()` (Line 46 as of writing this).
5. The first line in `writeToDB()` contains the following:

    `let file = Bundle.main.path(forResource: "BarNames", ofType: "txt")`

    Change the value of the `forResource:` parameter `"BarNames"` to the name of your `.txt` file. Do not include the `.txt` extension. For example, if my file was named `fileName.txt`, then my line would look like: `let file = Bundle.main.path(forResource: "fileName", ofType: "txt")`.

6. Your bars will be pulled from Yelp and uploaded to the database! Go to [Firebase](https://firebase.google.com/) and log in using the credentials listed in the Team Drive -- confirm that your bars were indeed uploaded.

You may need to change the parameter of the first line in `writeToDB()` back to `barNames` to avoid any merge conflicts when pushing to GitHub, but make sure to include your `.txt` in your branch so we have a record of who's pushed what bars to the database.
