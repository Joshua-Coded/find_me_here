#!/usr/bin/env bash

# A programme that takes student information
# and save the contents in txt file

# Function to create a student record


student_file = "student_list.txt"


create_student() {
    echo "Enter student email: "
    read email

    echo "Enter student age: "
    read age

    echo "Enter student ID: "
    read student_id

    echo "$email:$age:$student_id" > "$student_file"
    echo "Student record created successfully!!"
}


# Function to view all students

view_student() {
    echo "Lists of students"
    cat "$student_file"
}

# function to delete a student record by ID

delete_student(){
    echo "Enter student ID to delete"
    read student_id
    
    grep -v"^.*:$student_id$" "$student_file" >"$student_file"

    echo "Student record deleted successfully!"
}

# function to update students record

update_student() {
    echo "Enter student ID TO UPDATE:"
    read student_id

    echo "Enter updated email:"
    read email

    echo "Enter updated age:"
    read age

    sed -e "/^.*:$student_id$/s/[^:]*:[^:]*:[^:]*/$email:$age:$student_id/"

"$student_file" > "$student_file"

echo "Student record updated successfully"
}


#main function menu loop

while true; do

    echo "------------------------------------"
    echo "Welcome to the Bachelor of Software Engineering Cohort List"
    echo "-------------------------------------"

    echo "Please select an option:"
    echo "1. create a student record"
    echo "2. view all students"
    echo "3. Delete a student record"
    echo "4. Update a student record"
    echo "5. Exit"

    read choice

    case $choice in
	1)
	    create_student
	    ;;
	2)
	    view_student
	    ;;
	3)
	    delete_student
	    ;;
	4)
	    update_student
	    ;;
	5)
	    echo "Exiting the application....."
	    exit 0
	    ;;
    esac
    done
