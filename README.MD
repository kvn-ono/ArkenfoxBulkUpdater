# The user.js bulk update script
### This script is made to update all your arkenfox profiles faster and easier
> Only thing that will take more of your time is making override files for every profile, but you don't have to worry if you already have any (or not)


### The script is only made to work on GNU/Linux with sh compatible shell
> (My plan is to eventually expand the script to work with other possible options)

<br/>

<hr/>

# Additional info

### The script should work fine if everything goes as planned.
> Although be careful, read the script before you use it.<br/>
> If you don't know what this script is exactly doing,<br/>**I ADVISE YOU NOT TO USE IT** or **DO SO AT YOUR OWN RISK**

### For any questions/suggestions about the script, PM me via [SimpleX](https://smp19.simplex.im/a#rnMG2k4tcV0O1fSq6Z4nUtJoppSeIFbk6OwcavN5M_k)


### More info about `arkenfox user.js` on its own [repository](https://github.com/arkenfox/user.js)

<br/>

<hr/>

# A brief how-to
1. #### Clone the repository and start the program
    ```sh
    git clone https://github.com/Bluudek/ArkenfoxBulkUpdate.git
    ```
    or just download the scipt you need (there's no other options to choose from for now)

2. #### Prepare any user override files you need
    
    Put those files into **"~/.config/arkenfox/user-overrides/"**<br/>or change the **"user_override_dir"** variable in the script to your directory of choice.
    > ### IMPORTANT!
    > **Do not forget** to set the name of every override file to its corresponding user directory name for it to work.<br/>Example: `1a2b3c4d.FooProfile`<br/>If you don't know the profile directory name, check it in **about:profiles**
3. #### Start the script and follow instructions
    > #### It is highly advised to make a backup of your existing profiles, if you have any
    ```sh
    cd ArkenfoxBulkUpdate && ./update-profiles.sh
    ```
    #### or
    ```sh
    any/directory.of/choice/update-profiles.sh
    ```