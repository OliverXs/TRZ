# The Resident Zombie

So... you haven't been canceled yet? That's a good thing, I guess. Sometimes I think that being bitten by a vampire and becoming a fairy that shines in the sun now doens't sound so bad.

Well, whatever, let's talk about the plan!  
On my journey to create the world's last app, I had to make choices! (Actually, everything in life is a choice. That's not a coach thing! I swear!).

I decided to go with <strong>*Flutter*</strong>, because it reminds me the olds days when I used to write in C, and 'cuz it has more compatibility with the Android and IOS than  React Native, and it's more optimaze, but I love Javascript! PLEASE DON'T CANCEL ME! (*We never know when a zombie is listening...*)

## Day One
On my first day on this journey, I wasted time thinking about how I would like this app to be, and well, I think my color palette choices were inspired by old games and spiderman; the world had fallen, but my old inspirations were still alive in my mind.

After deciding how cores, take a program according to the application's screens. First "Sign In" (for illustrative purposes only hahaha) and "Sign Up".


## Day Two
So many problems with projections. I rethink the application a litle to late, but I think it will be more productive. I was thinking of using random ID for each user, so I wouldn't need to save their login information in the database, I would just save their IDs with their information, and then I would just create the "trades" in the database and match them with others users by location, but, it got a little complex, 'cause I had to change a lot of preview work, which could work, but I am literally in an apocalyptic world, and still with less time than I would like.

So, I use firebase auth to login and then create trades. At least, it will give us more security. Even so, I wouldn't want to force anyone to have an email in an apocalyptic world, but, you'll still need to use Android or IOS, so well, you're a force to have an email anyway.

## Day Three
Bad news. The tests went so well that I found several bugs, some were expected, but others caught me. I changed the API I used to get users' locations; and created the collections in firebase to save user information. I now hope to finish the profile and the trade system.


## Day Four
Google just thwarting my plans to use Google Maps to show traders on the map. So, I did it in a simple way.

## Tests, Bugs and Improviments
So, I did a lot of tests, but I forgot to take some screenshots of each one ... But, I re-registered and "Sign In" to test again and this time I took some screenhorts.
     I did tests, for example, with the old API (Geolocator), which uses obsolete Java packages, and does not work well with permissions on new versions of android and IOS, so I changed the API to "Location".
     I know this is a little frustrating, so I'll jump it and take all the responsibility for not being clear about the test stuff without excuse.

There are some behaviors that I know that I'll find in the app, like in the "Gender" field: I didn't put a "Choice button", so you can insert any text there that is "fine", I would like to change it, but I haven't done it yet.




<s>You can finish only the first part of the "Register" form, close the application and, when you open it again, you will be able to login, even if you have not completed the registration. :P</s> 

Deprecated, now you must finish the register form for get a "firebase account".

### Improvements

First I would like to correct these things that I mentioned earlier, then, put the Google Maps API to show the traders' locations and what they are trying to exchange. In my mind, it would look like Uber. Improve the colors and the profile screen. Let the user choose photos, update their data. 
<strong>  THE POINTS SYSTEM!!!! </strong> I didn't implement it, sorry, but in my defense the first time I realized how I would do this, I thought about making it look like the Stock Market hahahaha: P

## Conclusion
Well, I confess that not getting Google Map in time left me unmotivated, I think I could do better, but I am very proud of the "Main Color Pallet"; and it was the first time that I used the localization API and Firebase with flutter, well, it was a challenge that I loved, even if the result wasn't what I would like it to be. I am proud to have learned many new things in these 4 half days that I worked on it. It was worth it for me.
