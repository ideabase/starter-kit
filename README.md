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

### Database

- Open [phpMyAdmin](http://localhost/phpMyAdmin/) and create a new database
- In the new database, import `db_backup.zip` from the Starter Kit
- Remove the starter kit database backup from the new repository

### CMS

- In the project repository, rename the `.env.backup` file to `.env` and enter your database and site information within the file (default db username and password are both `root`)
- In `config/general.php` make sure that the dev environment URL matches the hostname you created in MAMP

### Node.js

- Install [Node.js](https://nodejs.org/en/download/) and open a terminal window
- Change directories into the httpdocs folder
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

## Post-Setup

- Open your new local website in a web browser (you may need to type the protocol "http://" before the hostname)
- In the admin control panel, enter settings > general and change the system name
- In the admin control panel, enter settings > sites and rename the site and site group to update the `siteUrl` global variable
- Be sure to create useful layouts that will be reusable throughout parts of your site (see the [twig documentation](https://twig.symfony.com/doc/2.x/tags/extends.html))

## Resources

- [Craft 3 Documentation](https://docs.craftcms.com/v3/)
- [Craft 3 Class Reference](https://docs.craftcms.com/api/v3/)
- [Craft CMS Stack Exchange](https://craftcms.stackexchange.com/)
- [Twig Documentation](https://twig.symfony.com/doc/2.x/)
