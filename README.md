# Manage-Multiple-Hosting-Service
This Project help you for managing and administrating your hosting service based on cpanel.

** make sure that you be in `Manage-Multiple-Hosting-Service` directory then run any command **

## 1. Start tools:
fist you should fill `destination.list` file for specify destinations (hosting machines). make sure that every hosting machine available from your server and authenticate with SSH-KEY.

## 2. Scripts:
### 2.1 `give-user-data.sh`:
this script help you to find details of user using email addressess.
standard out-put:
```bash
$SERVER_NAME, $USER_NAME, $SUSPEND_STATUS, $EMAIL, $DOMAIN 
```
like:
```bash
hosting-1, itsmj, 0, s.m.javadi001@gmail.com, h1.smj.com 
```
if you see `0` in output it means that this account not suspended
if you see `1` in output it means that this account suspended


Run:
```bash
./give-user-data.sh EMAIL
```
like:
```bash
./give-user-data.sh s.m.javadi001@gmail.com
```

### 2.2 `suspend-by-email.sh`:
you can suspend account of some email in every hosting servers.

RUN:
```bash
./suspend-by-email.sh EMAIL
```
like:
```bash
./suspend-by-email.sh s.m.javadi001@gmail.com
```

### 2.3 `unsuspend-by-email.sh`:
you can unsuspend account of some email in every hosting servers.

RUN:
```bash
./unsuspend-by-email.sh EMAIL
```
like:
```bash
./unsuspend-by-email.sh s.m.javadi001@gmail.com
```

### 2.4 `terminate-by-email.sh`:
in this script we terminate and remove all data from one user but email address.

RUN:
```bash
./terminate-by-email.sh EMAIL
```
like:
```bash
./terminate-by-email.sh s.m.javadi001@gmail.com
```


ENJOY THE WORLD WITHOUT HAMMADLI!!!!
