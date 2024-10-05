

mkdir -p submission_reminder_app/app
mkdir -p submission_reminder_app/modules
mkdir -p submission_reminder_app/assets
mkdir -p submission_reminder_app/config


echo "Main directory and subdirectories succesfully created!"

touch submission_reminder_app/app/reminder.sh
touch submission_reminder_app/modules/functions.sh
touch submission_reminder_app/assets/submissions.txt
touch submission_reminder_app/config/config.env
touch submission_reminder_app/startup.sh


echo "All files succesfully created as well!"


echo 'ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > submission_reminder_app/config/config.env


echo '#!/bin/bash


# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh


# Path to the submissions file
submissions_file="./assets/submissions.txt"


# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"


check_submissions $submissions_file' > submission_reminder_app/app/reminder.sh




echo '#!/bin/bash


# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"


    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)


        # Check if assignment matches and status is "not submitted"
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}' > submission_reminder_app/modules/functions.sh

echo "All provided file contents incorporated!" cat <<EOL >> submission_reminder_app/assets/submissions.txt
Student Name, Assignment, Status
Gaza, Shell Navigation, not submitted
Damage Defacto, Shell Navigation, submitted
Kavido Guccitaly, Shell Navigation, not submitted
Slickman Tyrus, Shell Navigation, submitted
Cibullie the Champion, Shell Navigation, not submitted
EOL


echo "Five more student records added!"


echo '#!/bin/bash

# Step 1: Ensure we are in the correct directory
cd submission_reminder_app

# Step 2: Start the reminder app
echo "Starting the Reminder App..."


# Execute the reminder script
bash ./app/reminder.sh


echo " Reminder App has been executed successfully!"' > submission_reminder_app/startup.sh

echo "Startup.sh Script created!"


chmod +x submission_reminder_app/startup.sh
                                                                                                                                                 


                                       

