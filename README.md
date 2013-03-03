ADNActivityCollection
=====================

## UIActivities to share with ADN apps from an standard Activity Sheet new in iOS 6

Sharing messages to App.net (ADN) with apps like Netbot and Felix can help get more content
onto ADN and give users sharing options they want. This sample project will provide a collection
of activities which will detect if an ADN app is available and make it available as an option if
it is. (See Screenshot below)

## How to use ADNActivityCollection

The sources files you would need are in the ADNActivities folder. There is the base class and
the Felix and Netbot activities. The images used for the icons are drawn in code thanks to
[PaintCode](http://www.paintcodeapp.com/) so there are not resources you need to add or manage
in your project. You will need [BBlock](https://github.com/kgn/BBlock) to your project. Just
load the iOS sources files since it also includes Mac source files as well. What is used is
the UIImage+BBlock category for drawing images using code provided by PaintCode. You could
simply add just the header and implementation file for that category. The entire project from
GitHub is used here as a submodule to help with staying current.

Once you have the sources files added you can use the example in SSTViewController to set up
the activities which are shown by the Activity Sheet. It creates an array of activity items which
includes an NSString and NSURL value if both fields are populated. A URL is simply added to the
NSString value for the ADN activities but Twitter and Facebook using them as links. If Felix,
Netbot or another ADN client has the option to take an NSURL value it could be passed as well
to share on ADN.

## What about my favorite ADN app?

More apps can be supported. All that is needed is a URL Scheme with a way to send a new post
over to the app. Both Felix and Netbot had support already as you can see from the following pages.

 * [Felix](http://tigerbears.com/felix/urls.html)
 * [Netbot](http://tapbots.com/blog/development/tweetbot-url-scheme) (Same as Tweetbot)

## Return URL Scheme

One additional parameter which is sent to the other apps is a value which can be used to return
to the calling app once the post operation has completed. This way the sequence of sharing returns
to the originating app. It is likely developers will be more likely to integrate ADN clients with
these activities if they know they are not sending users away from their app with this option.
ADN clients should return to the calling app either when the post is completed or if it is canceled.

## No View Controller

For other sharing options there is typically a view controller which allows the user to edit and
share the content from within the app. Since these activities are meant to use a third party app
to authenticate with ADN and complete the post. It makes sense to warn they user they are about to
leave the app though, so a view controller which can preview the message and allow the user to 
cancel if the choose instead if jumping to another app.

## Contributions

Additional ADN clients can be supported on iOS by simply using the current activities as a reference.
The Felix and Netbot activities use a base class which does much of the work. Simply fork this project
on GitHub and submit a Pull Request once you are ready. Pull Requests will be reviewed and added if
they appear to be ready to be included with the collection.

## Support

Issue tracking on GitHub can be used for any issues which come up. Otherwise I can be found on ADN. 

Brennan Stehling  
[@smallsharptools](http://alpha.app.net/smallsharptools)

## Screenshot

<img src="https://raw.github.com/brennanMKE/ADNActivityCollection/master/ADNActivity.png" width="320px" alt="Screenshot" />

