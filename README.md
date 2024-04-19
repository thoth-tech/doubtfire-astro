# Ontrack-Technical-documentation

## How To run locally:

Prerequisite: Install and setup wampserver for Windows OS/ xampp for others
Follow:
- https://wpastra.com/guides-and-tutorials/install-wordpress-on-wamp/
- https://themeisle.com/blog/install-xampp-and-wordpress-locally/#gref

### Steps to work locally:
1. Checkout this repository.
2. Copy the folder 'wordpress/ontrackdocumentation' to 'www' folder for wamp or 'htdocs' folder for xampp
3. Run the wamp/xampp server on your local machine. This will run wordpress on your system.
4. Access wordpress through (http://localhost/ontrackdocumentation/)
5. Make changes to your website using wordpress tool via 'Customize' or 'Edit with Elementor' on the top menu bar.
6. [Install Simply Static plugin](#install-simply-static-plugin) this will be onetime setup activity.
7. Once all the changes are finalized, generate the static files. Go to http://localhost/ontrackdocumentation/wp-admin/admin.php?page=simply-static-generate. Click Generate Static Files. This will update our project.
8. Commit and push the changes.

### Install Simply Static plugin
1. Navigate to Plugins from your Wordpress dashboard (http://localhost/ontrackdocumentation/wp-admin/plugins.php)
2. Search for Simply Static plugin
3. Install and Activate the plugin
4. Go to Simply static on left side banner (http://localhost/ontrackdocumentation/wp-admin/admin.php?page=simply-static-generate). Navigate to Deploy to change the deployment setting to "Local Directory" and set the local path to 'static-site' folder of this project
  


