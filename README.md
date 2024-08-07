<h1 align="center">
  <br>
  <a href="https://www.sqlynx.com"><img src="./sqlynx-icon.svg" alt="SQLynx" width="200"></a>
  <br>
  SQLynx Pro
  <br>
</h1>

<h3 align="center">Desktop And Web SQL Tool. Both web and desktop access. Support popular SQL databases like mysql, mariadb, postgresql, sqlite and more. </h3>

<p align="center">
  <!-- <a href="https://badge.fury.io/js/electron-markdownify">
    <img src="https://img.shields.io/github/release/owner/repo.svg"
         alt="Version">
  </a> -->
  <a href="https://badge.fury.io/js/electron-markdownify">
    <img src="https://img.shields.io/badge/version-3.5.0-red"
         alt="Version">
  <a href="https://jdk.java.net/java-se-ri/8-MR6">
    <img src="https://img.shields.io/badge/jdk-8+-blue">
  </a>
  <a href="https://saythanks.io/to/bullredeyes@gmail.com">
      <img src="https://img.shields.io/badge/service@sqlynx.com-%E2%98%BC-1EAEDB.svg">
  </a>
  <a href="https://www.paypal.me/AmitMerchant">
    <img src="https://img.shields.io/badge/docs-80%25-brightgreen">
  </a>
</p>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#download">Download</a> •
  <a href="#license">License</a>
</p>

![screenshot](./images/sql-query-show.png)
![screenshot](./images/table-management-show.png)
![screenshot](./images/data-export-import-show.png)
![screenshot](./images/sample-data-generation-show.png)

## Key Features
- SQL Query
- Tables Management
- Data Export & Import
- Sample Data Generation

## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and [JDK 1.8+](https://jdk.java.net/java-se-ri/8-MR6) installed on your computer. From your command line:

### Manual Execution

To manually set up and run the application, follow these steps:

```bash
# Clone the Repository:
$ git clone https://github.com/ChHsiching/SQLynx.git

# Navigate to the Repository:
$ cd SQLynx

# [Optional] Change File Ownership:
# Replace `[OWNER]` with your user and `[GROUP]` with your group if necessary.
$ chown [OWNER][:GROUP] *

# Assign Executable Permissions:
$ find . -type f -name "*.sh" -exec chmod 755 {} +

# View Available Commands:
$ ./sqlynx-ide.sh

# You will see:
# *************************************************
# **                                             **
# **         sqlynx-ide  commands                **
# **                                             **
# *************************************************
# **       sh  sqlynx-ide.sh start               **
# **       sh  sqlynx-ide.sh stop                **
# **       sh  sqlynx-ide.sh restart             **
# *************************************************

# Run the app:
$ sudo sh sqlynx-ide.sh start

# Stop the app:
$ sudo sh sqlynx-ide.sh stop
```

### Automated Deployment

For automated deployment, use the provided `deploy.sh` script. This script will handle the setup and configuration automatically.

```bash
# Clone the repository
$ git clone https://github.com/ChHsiching/SQLynx.git
   
# Navigate to the repository
$ cd SQLynx

# Assign Executable Permissions:
$ chmod 755 deploy.sh

# Run the deployment script
$ ./deploy.sh
```
The `deploy.sh` script will:
- Copy necessary files to the installation directory.
- Set up executable permissions for all shell scripts.
- Register the application with the system (e.g., create symlinks, install desktop entries).

Post-Deployment:
After running the `deploy.sh` script, you can start and stop the application using the `sqlynx` command:

```bash
# Start the application
$ sqlynx start

# Stop the application
$ sqlynx stop
```

> **Note**
> If you're using Windows operating system or want to read official documentation, see [the Installation Guide](https://www.sqlynx.com/content/document/en_version/SQLynx_installation%20documentation_v3.0.0.pdf).

## Download

You can [download](https://www.sqlynx.com/download/) the latest installable version of SQLynx for Windows, macOS and Linux.