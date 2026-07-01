This repository is a template for writing a new IETF individual submission. It has all the Makefiles, Dockerfiles, and other tools needed to build the draft. It has support for validating YANG modules that you may want to include in the draft.

# What do you need
To build the draft from this template, you need to have Docker installed and running on the machine where this repository will be cloned.

# Structure of the repository

The repository consists of the following

- Makefile
- Dockerfile
- start.sh
- src
- src/addstyle
- src/replace.sh
- src/download-dependent-modules.py
- src/validate-and-gen-trees.sh
- src/insert-figures.sh
- src/yang folder: consists of any YANG modules and instance examples for the YANG module
- draft
- draft/Makefile
- draft/draft-rfcxml-general-template-annotated.xml

# Suggested workflow
## Create a copy of the repository

### Using this template

To use this repository, click on "Use this template" button near to top right, and in the drop down menu select "Create a new repository". It will allow you to rename the repository to what you want, while still copying all the files and directories over.

## Rename or copy a draft

The template includes an XML file for the draft in the draft folder. Rename that file to match the name of the draft. The 'make' command uses the name of this file to determine the names of the .html, .txt files. Something like

	`git mv draft/draft-rfcxml-general-template-annotated.xml draft/draft-xxx-yyy-zzz.xml`

After renaming, make sure to update the name of the draft inside the XML file also. See [Naming of the draft](#naming-of-the-draft).

## Create a branch for the version of the draft

### Create branch

Create a branch off of the 'master' branch that matches the version of the draft to be published. For example, if the next version of the branch is draft-xxx-yyy-zzz-01, create a branch for v01 using the following command:

	`git checkout -b v01`
	
Push the branch to the remote site and follow the steps labeled [Make it the default branch](#make-it-the-default-branch) below for making it the default branch. 

    `git push --set-upstream origin v01`

However, keep this branch "clean", as in do not make changes in the branch directly. Instead, allow PR to update the branch. To do that, create "issue branches" off of the new branch you have created. For example, if you create an issue #1, to update the name of the draft in the XML file, create a branch issue-1 and do your work there.

Do this for every version of the draft.

### Make it the default branch

In the GitHub UI for the repository, as admin, set the branch you have created, e.g., v01, as the default branch in the Settings (for the repository) menu. Update this every time a new branch is created for a new version of the draft.
	
### Create a tag

If this is the -00 version of the draft, skip this step.

Next, create a git tag for the draft-xxx-yyy-zzz.xml as follows:

	`git tag draft-xxx-yyy-zzz-00`

This will tell 'make' which version of the draft to build

Remember to push the tag along with any other changes to the remote.

	`git push origin <tagname>`

Or type the following command to push all tags. Git will ignore duplicate tags:

	`git push origin --tags`
	
## Naming of the draft

As mentioned already, the 'git tag' command tells make what version to build. To do that right, the name of the draft in the XML file (docName under &lt;rfc&gt; and value under &lt;seriesInfo&gt if that line exists;) should be called the name of the draft followed by the word 'latest'. For example, if the draft name is draft-xxx-yyy-zzz, the both the variables should say 'draft-xxx-yyy-zzz-latest'. Make will replace latest with the version that the draft needs to be built with.

## Building the draft

To build the draft, type make in the root of the repository

	`make`	

## Fixing and tracking issues

Use the Issues menu in GitHub to keep track of issues that need to be addressed for the draft. Create a branch for every issue, e.g., issue-01, and tag that PR using the Development tab to close the issue when the PR gets committed. Make sure the issue is set to be committed to the correct branch.

## Publishing the draft

Once the draft is published, that version of the branch should be collapsed into the 'master' branch, and the above steps to [Create a branch for the version of the draft](#create-a-branch-for-the-version-of-the-draft) should be followed.