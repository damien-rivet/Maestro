# Contributing

## Summary

- [Setup](#setup)
- [Branching Model](#branching-model)
  - [Master](#master)
  - [Develop](#develop)
  - [Patterns](#patterns)
- [Commits](#commits)
- [Unit testing](#unit-testing)
- [Linting](#linting)

## Setup

To get started on contributing on `Maestro` you'll need to perform those steps:

1. Download and install the latest stable version of **Xcode**
1. Clone the repository from `GitHub`
1. Open `Maestro.xcworkspace` with **Xcode** (do not drag & drop the folder as it will open it as a Swift Package)

We recommend the usage of the following useful tools:

- [Visual Studio Code](https://code.visualstudio.com)
- [SwiftLint](https://github.com/realm/SwiftLint)

## Branching model

The current branching model of `Maestro` is built upon [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model) from [Vincent Driessen](http://nvie.com).

Every single change that targets the main branches (master, develop) can only be merged through a pull request.

### Master

This very peculiar branch is used only for hosting the releases of `Maestro`.

Apart from the code coming from the release branches, it is allowed to create pull request to merge hotfixes and documentation fixes.

To perform a new release, a branch (named like **release/release-x.x.x**) must be created from the **develop** branch. Once all the preparatory work is done, a pull request (named like **Release x.x.x**) must be created with **master** as the target.

Once everything is settled on the pull request (version bump, up-to-date documentation, hotfixes, etc.) it will be merged into **master**. Right after, a new tag (named like **x.x.x**) will be associated with the merge commit.

### Develop

This branch can be considered as the main working branch, every change toward the next release is staged here until the next release branch is created.

You're free to rebase on develop whenever you need to get the latest change in your branch.

### Patterns

All branches inside the `Maestro` repository needs to follow one of the pattern below:

- feature/{branch_name}
- bug/{branch_name}
- release/{branch_name}
- hotfix/{branch_name}

Pull requests coming from branches which are not matching any of those pattern will be declined.

## Commits

Before commiting anything to you branch, make sure to add relevant message and description to your commit.

If you need to some insights on how to actually do this, here's some helpful readings:

- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit)
- [What makes a good commit message?](https://hackernoon.com/what-makes-a-good-commit-message-995d23687ad)

## Unit testing

New objects must be committed alongside their unit tests so every breaking changes in the API or missing implementations can be monitored.

## Linting

Currently, `Maestro` includes the `SwiftLint` script to enforce a general quality of the code.
