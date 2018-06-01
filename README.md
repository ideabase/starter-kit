# IdeaBase Starter Kit 2.0

#### IdeaBase Starter Kit v2: Includes Grunt, Pattern Lab, Craft CMS.

## Setup Instructions

### Git Instructions

1.  Create a New Repository under IdeaBase
2.  [Install Tower](https://www.git-tower.com/) or [GitHub Desktop](https://desktop.github.com/) (or use command line if you want)
3.  Log into GitHub and [clone the new repository](https://help.github.com/articles/cloning-a-repository/)
4.  Download the [IdeaBase Starter Kit 2.0 zip file](https://github.com/ideabase/starter_kit2/archive/master.zip) and copy the files into the repository
5.  Commit and push changes to repository using "[Push - Tower](https://www.git-tower.com/help/mac/branches-and-tags/push)" or "[Publish - Github Desktop](https://services.github.com/on-demand/github-desktop/push-with-github-desktop)"

### MAMP (PHP, MySQL)

1.  [Install MAMP Pro](https://www.mamp.info/en/mamp-pro/)
2.  Under ports, select "set server ports to 80, 81, 443, etc..."
3.  Set up a new host directory (e.g. `example.web`) and point to the `public/` or `html/` folder (web document root) instead of the project root
4.  In the hosts tab, click the plus button underneath the box where "localhost" is listed
5.  If using a CMS, set up a local database
6.  Set the default password for your database to "root"
7.  Start the local server by pressing the start button in MAMP

### Composer Setup (OSX/Linux)

1.  In a terminal window, use cURL to download Composer as a .phar (PHP archive) file in your home directory

```bash
curl -sS <https://getcomposer.org/installer> | php ~/
```

2.  Next, move the .phar file to the local computer binaries folder, and enter your password when prompted

```bash
sudo mv ~/composer.phar /usr/local/bin/
```

3.  Establish a global alias for the composer command in your ~/.bash_profile

```bash
vim ~/.bash_profile
alias composer="php /usr/local/bin/composer.phar"
```

4.  Execute `composer` in your project to make sure the alias works globally
5.  Run `composer update` within the project to update dependencies.

### Craft CMS Instructions

1.  Rename `craft/config/db-backup.php` to `db.php`
2.  Edit `craft/config/db-backup.php` file with your local database name
3.  You can "Ignore" the db.php file once it's been edited with the local info so there's no chance of it being overwritten to production
4.  **Important**: Rename the `public/htaccess` file to `.htaccess`
5.  In craft/config/general.php - change the LOCAL url to your local URL
6.  Go to `http://example.web/admin` to begin CMS setup

### Pattern Lab

-   If using Pattern Lab, change the "htaccess" file in the public/lab folder to .htaccess, which will automatically redirect visitors at `/lab` to the `/lab/public` directory

### Command Line Instructions

1.  [Install Node.js](https://nodejs.org/en/download/)
2.  Open the command line interface
3.  Install SASS with RubyGems (Ruby is built into OSX, on Windows use the recommended <https://rubyinstaller.org/>)

```bash
gem install sass
```

4.  Install Grunt globally with npm

```bash
npm install -g grunt-cli
```

5.  Navigate to your project's web document root (the `public/` or `html/` folder) and execute the command `grunt` to ensure that Grunt is working properly

##### Grunt will do the following:

-   Compress (minify) CSS processed from SASS
-   Autoprefix CSS
-   Combine and compress all JavaScript files
-   Autobuild the Pattern Lab files (if needed)
-   Autorefresh the browser when HTML or CSS files are updated

* * *

**TODO: Fix critical CSS **
