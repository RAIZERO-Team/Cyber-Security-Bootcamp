#!/bin/bash

# First, create a new user
echo "Enter the username you want to create:"
read username

# Check if the user already exists
if grep -q -i "^$username:" /etc/passwd; then
    echo "User $username already exists."
else
    echo "Enter the preferred shell for $username (e.g., /bin/bash):"
    read shell
    echo "Should this user have SUDO privilege? (Yes/No):"
    read sudo_priv

    # Create the user
    sudo useradd -m -s "$shell" "$username"

    # If user should have sudo privileges, add them to the sudo group
    if [ "$sudo_priv" = "Yes" ]; then
        sudo usermod -aG sudo "$username"
    fi

    # Set the user's password
    echo "Enter the password for $username:"
    sudo passwd "$username"

    echo "User $username has been created successfully."
fi

