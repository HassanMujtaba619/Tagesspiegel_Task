# Tagesspiegel Registration Automation

This project automates the registration process for the Tagesspiegel website using Robot Framework and Selenium.

## Setup

### 1. Clone the Repository

```sh
git clone https://github.com/your-username/tagesspiegel-registration-automation.git
cd tagesspiegel-registration-automation
```

### 2. Create a Virtual Environment

```sh
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```

### 3. Install Dependencies

```sh
pip install -r requirements.txt
```

### 4. Ensure Node.js is Installed

Download and install Node.js from [https://nodejs.org/](https://nodejs.org/).

## Running the Tests

### Set Environment Variable

On Unix-like systems:
```sh
export ENV=tagesspiegel.de
```

On Windows:
```sh
set ENV=tagesspiegel.de
```

### Run the Test

```sh
robot --variable ENV:${ENV} -d output tests/registration.robot
```
