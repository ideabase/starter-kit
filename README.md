# IdeaBase Starter Kit (Craft 3)

## Setup

### GitHub

- Create a new repository under IdeaBase's account
- Clone the repository to your computer using your Git client of choice
- Download the compressed (.zip) Starter Kit from GitHub and copy its contents to the cloned repository

### Local Web Server

- Download and install [MAMP Pro 4.5](https://www.mamp.info/en/downloads/older-versions/)
- In the Ports tab, click the button that sets server ports to 80, 81, 443, 7443, 3306, and 11211
- In MAMP, open the hosts tab and click the "+" button below the list of hosts to create a new host
- Name the host and give it a top-level domain that will not conflict with existing websites, like ".local" or ".web"
- Click the folder icon across from "Document root" and select the `httpdocs/` folder in your cloned repository

### PHP

- In MAMP, select the PHP tab and ensure that the PHP version selected is 7 or greater
- In MAMP, go to File > Edit Template > PHP > then the version that is currently active
- In the template editor, edit the following directives as follows
```php
max_execution_time = 120  // Craft CMS requires this to be greater than or equal to 120s
memory_limit = 1G         // Craft CMS requires this to be 256M, but a higher value may be helpful for local development
post_max_size = 128M      // this may be necessary for local development
```

### Database

- Open [phpMyAdmin](http://localhost/phpMyAdmin/) and create a new database
- In the new database, import `db_backup.zip` from the Starter Kit
- Remove the starter kit database backup from the new repository

### CMS

- In the project repository, rename the `.env.backup` file to `.env` and enter your database and site information within the file (default db username and password are both `root`)
- In `config/general.php` make sure that the dev environment URL matches the hostname you created in MAMP

### Node.js

- Install [Node.js](https://nodejs.org/en/download/) and open a terminal window
- Change directories into the `httpdocs/` folder
```sh
cd httpdocs
```
- Install the local node packages and globally install sass and grunt-cli
```sh
npm i
npm i -g sass grunt-cli
```
- In the `httpdocs/` folder of the project, edit `Gruntfile.js` and enter your local site URL into the criticalcss options
- After installation, Grunt can be used with the command `grunt` in the `httpdocs/` folder to compile SCSS into CSS and minify CSS and JS files
- Issuing the command `grunt critical` will generate critical css as `httpdocs/css/critical.css`

## Post-Setup

- Open your new local website in a web browser (you may need to type the protocol "http://" before the hostname)
- In the admin control panel, enter settings > general and change the system name
- In the admin control panel, enter settings > sites and rename the site and site group to update the `siteUrl` global variable
- In the admin control panel, enter utilities > system report and check that all PHP requirements for Craft are fulfilled
- Be sure to create useful layouts that will be reusable throughout parts of your site (see the [twig documentation](https://twig.symfony.com/doc/2.x/tags/extends.html))

## Resources

- [Craft 3 Documentation](https://docs.craftcms.com/v3/)
- [Craft 3 Class Reference](https://docs.craftcms.com/api/v3/)
- [Craft CMS Stack Exchange](https://craftcms.stackexchange.com/)
- [Twig Documentation](https://twig.symfony.com/doc/2.x/)
