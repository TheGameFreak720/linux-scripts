# Scripts

## Description

This repo is designed to hold all the scripts I use on my Linux machine that make my life easier.

## git-pr-reviewers.js

### Description

Designed by [Erin Sullivan](https://github.com/erinesullivan) to give me 2 coworkers to review one of my PR's. It's divided in sections making
it easier to specify which department is the one I need to be reviewing the PR.

### Usage

This command will pick 2 coworkers from fe, be and qa
`node git-reviewers.js`

Usage with arguments

`node git-reviewers.js qa fe`

Available arguments

* be (back-end)
* fe (front-end)
* qa (quality assurance)
* do (dev-ops)
* pm (project manager)
* all

## .sh

### Usage

`bash name-of-script.sh`

### review-docs.sh

#### Description

Makes life easier by creating a document with a timestamp of today in the directory `~/Documents/tmp`. This document has a template that I use for handling PR reviews.
After the document is created it opens it using the vim text editor.

### set-initial-env-fedora.sh

#### Description

Initial configuration for a fresh install of Fedora. Before running this script verify the commands are compatible with your system and the git config is changed to what you want.

### set-dev-env-fedora.sh

#### Description

A script that installs important programs that I use day to day as a developer for Fedora distro

### set-normal-env-fedora.sh

#### Description

A script that installs programs that I use that aren't related to development on the Fedora distro

### set-dev-env-ubuntu.sh

#### Description

A script that installs important programs that I use day to day as a developer for Ubuntu distro

### set-normal-env-ubuntu.sh

#### Description

A script that installs programs that I use that aren't related to development on the Ubuntu distro

