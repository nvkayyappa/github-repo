CURRENTDIR=${pwd}

# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
echo "What name do you want to give your remote repo?"
read REPO_NAME

echo "Enter a repo description: "
read DESCRIPTION


# step 2:  the local project folder path
echo "what is the absolute path to your local project directory?"
read PROJECT_PATH

echo "What is your github username?"
read USERNAME
echo "password"
read PASSWD

# step 3 : go to path
cd "$PROJECT_PATH"


# step 4: initialise the repo locally, create blank README, add and commit
git init
touch README.MD
git add README.MD
git commit -m 'initial commit -setup with .sh script'


# step 5 use github API to log the user in
echo ">>> Creating your ${repo} in remote."
gh repo create "${repo}"

git remote add origin git@github.com:"${user}"/"${repo}".git
echo ">>> Pushing local repo to the remote."
git push -u origin main
echo ">>> You have created a github repo at https://github.com/${user}/${repo}"

exit 0


