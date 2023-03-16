#!/usr/bin/env bash

# Close all System Preferences panes before making changes
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Update existing `sudo` time stamp until `osx-defaults.sh` has finished
while true; do
   sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2> /dev/null &

echo 'setting defaults for the dock'

# Size (16~128)
defaults write com.apple.dock tilesize -int 38

# Magnification
defaults write com.apple.dock magnification -bool true

# Set size when enlarged
defaults write com.apple.dock largesize -int 74

# Set dock position
defaults write com.apple.dock orientation -string "bottom"

# set animations effect when closing a window
defaults write com.apple.dock mineffect -string "genie"

# Double-click a window's title bar
defaults write -g AppleActionOnDoubleClick -string "Maximize"

# Minimize windows into applicaiton icon
defaults write com.apple.dock minimize-to-application -bool false

# Automatically hide and show the dock
defaults write com.apple.dock autohide -bool true

# Recent applications in dock
defaults write com.apple.dock show-recents -bool false

# Remove all default apps in dock except Finder and Trash
defaults write com.apple.dock persistent-apps -array

killall Dock

echo 'setting defaults for the finder'

# Enable quit option for finder
defaults write com.apple.finder QuitMenuItem -bool true

killall Finder

echo 'setting defaults for the keyboard'

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo 'setting defaults for the menubar'

# Set menubar digital clock format
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  j:mm a"

# Auto-hide the menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

killall SystemUIServer

echo 'setting defaults for the screenshot location'

SCREENSHOT_LOCATION="$HOME"/Documents/Screenshots
[ -d "$SCREENSHOT_LOCATION" ] || mkdir "$SCREENSHOT_LOCATION"

# set location to ~/Documents/Screenshots
defaults write com.apple.screencapture location -string "$SCREENSHOT_LOCATION"

killall SystemUIServer

echo 'setting defaults for the trackpad'

# Setting Trackpad Gesture
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad DragLock -int 0
defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadHandResting -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# Set track speed to very fast (min: 1.0, max: 5.0)
defaults write -g com.apple.trackpad.scaling 2.5

# Set mouse speed to very fast (min: 1.0, max: 5.0)
defaults write -g com.apple.mouse.scaling 4.5

# Setting mouse Gesture
defaults write com.apple.AppleMultitouchMouse MouseButtonDivision -int 55
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string TwoButton
defaults write com.apple.AppleMultitouchMouse MouseHorizontalScroll -int 1
defaults write com.apple.AppleMultitouchMouse MouseMomentumScroll -int 1
defaults write com.apple.AppleMultitouchMouse MouseOneFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerDoubleTapGesture -int 3
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchMouse MouseVerticalScroll -int 1

# Fade transition between workspaces instead of using movement.
# defaults write com.apple.Accessibility ReduceMotionEnabled -bool true
defaults write com.apple.universalaccess reduceMotion -bool true
# defaults write com.apple.universalaccess reduceMotion -int 1

# Disable Airplay Receiver to free up port 5000 used in development
defaults -currentHost write com.apple.controlcenter AirplayRecieverEnabled -int 0

echo 'setting defaults for font smoothing'

# Font Smoothing
defaults -currentHost delete -globalDomain AppleFontSmoothing
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
defaults -currentHost write -globalDomain AppleFontSmoothing -int 0

defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

echo "Done. Note that some of these changes require a logout/restart to take effect."
