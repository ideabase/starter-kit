# IdeaBase Starter Kit (Craft 3)

## Setup

### GitHub

- Create a new repository under IdeaBase's account
- Clone the repository to your computer using your Git client of choice
- Download the compressed (.zip) Starter Kit from GitHub and copy its contents to the cloned repository

### Local Web Server

- Download and install [MAMP Pro](https://www.mamp.info/en/downloads/)
- In the Ports tab, click the button that sets server ports to 80, 81, 443, 7443, 3306, and 11211
- In MAMP, open the hosts tab and click the "+" button below the list of hosts to create a new host
- Name the host and give it a top-level domain that will not conflict with existing websites, like ".local" or ".web"
- Click the folder icon across from "Document root" and select the `httpdocs/` folder in your cloned repository

### Database

- Open [phpMyAdmin](http://localhost/phpMyAdmin/?lang=en&language=English) and create a new database
- In the new database, import `db_backup.zip` from the Starter Kit

### CMS

- In the project repository, rename the `.env.backup` file to `.env` and enter your database and site information within the file
- In `config/general.php` make sure that the dev environment URL matches the hostname you created in MAMP

### Node.js

- Install [Node.js](https://nodejs.org/en/download/) and open a terminal window
- Change directories into the httpdocs folder
```sh
cd httpdocs
``` 
- Install the required node modules
```sh
npm i
```
- After installation, Grunt can be used with the command `grunt` in the `httpdocs/` folder to compile SCSS into CSS and minify CSS and JS files

## Post-Setup

- Open your new local website in a web browser (you may need to type "http://" before the hostname)
- Be sure to create useful layouts that will be reusable throughout parts of your site (see the [twig documentation](https://twig.symfony.com/doc/2.x/tags/extends.html))

## Resources

- [Craft 3 Documentation](https://docs.craftcms.com/v3/)
- [Craft 3 Class Reference](https://docs.craftcms.com/api/v3/)
- [Craft CMS Stack Exchange](https://craftcms.stackexchange.com/)
- [Twig Documentation](https://twig.symfony.com/doc/2.x/)
