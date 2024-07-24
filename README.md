## `devopsfetch` Script Documentation

### Overview
The `devopsfetch` script is designed to retrieve and display system information for DevOps purposes. It provides various options to fetch details about active ports, Docker containers, Nginx domains, user logins, and system logs within a specified time range.

### Installation and Configuration

1. **Download the Script:**
   Save the script to a desired location on your server. For example, `/usr/local/bin/devopsfetch`.

2. **Set Executable Permissions:**
   ```bash
   sudo chmod +x /usr/local/bin/devopsfetch
   ```

3. **Run the Script:**
   ```bash
   devopsfetch [OPTIONS]
   ```

### Command-Line Options

#### `-p`, `--port [PORT_NUMBER]`
Display active ports or information about a specific port.

- **Usage:**
  - List all active ports:
    ```bash
    devopsfetch -p
    ```
  - Display information about a specific port:
    ```bash
    devopsfetch -p 80
    ```

#### `-d`, `--docker [CONTAINER_NAME]`
Display Docker images/containers or information about a specific container.

- **Usage:**
  - List all Docker images and containers:
    ```bash
    devopsfetch -d
    ```
  - Display information about a specific Docker container:
    ```bash
    devopsfetch -d <CONTAINER_NAME>
    ```

#### `-n`, `--nginx [DOMAIN]`
Display Nginx domains or information about a specific domain.

- **Usage:**
  - List all Nginx domains:
    ```bash
    devopsfetch -n
    ```
  - Display information about a specific Nginx domain:
    ```bash
    devopsfetch -n example.com
    ```

#### `-u`, `--users [USER]`
Display user logins or information about a specific user.

- **Usage:**
  - List all user logins:
    ```bash
    devopsfetch -u
    ```
  - Display information about a specific user:
    ```bash
    devopsfetch -u john
    ```

#### `-t`, `--time [START_DATE] [END_DATE]`
Display activities within a specified time range. The date format should be `YYYY-MM-DD`.

- **Usage:**
  - Display logs from a start date to the current date:
    ```bash
    devopsfetch -t '2024-07-22'
    ```
  - Display logs within a specified date range:
    ```bash
    devopsfetch -t '2024-07-22' '2024-07-23'
    ```

#### `-h`, `--help`
Display the help message.

- **Usage:**
  ```bash
  devopsfetch -h
  ```

### Logging Mechanism

#### System Logs
The `devopsfetch` script uses the `journalctl` command to fetch system logs. The logs can be filtered based on a specified time range using the `-t` or `--time` option.

- **Fetch Logs:**
  ```bash
  devopsfetch -t '2024-07-22' '2024-07-23'
  ```

- **Log Error Handling:**
  If an error occurs while fetching logs, the script will display an error message and list the available log range using the `journalctl --list-boots` command.

### Examples

- Display active ports:
  ```bash
  devopsfetch -p
  ```

- Display Docker information:
  ```bash
  devopsfetch -d nginx
  ```

- Display Nginx domain configuration:
  ```bash
  devopsfetch -n example.com
  ```

- Display user logins:
  ```bash
  devopsfetch -u
  ```

- Display logs for a specific date range:
  ```bash
  devopsfetch -t '2024-07-22' '2024-07-23'
  ```

This documentation provides comprehensive steps to install, configure, and use the `devopsfetch` script, along with examples for each command-line option.
