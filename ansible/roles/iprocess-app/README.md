# Ansible Role: xml-app-config

Configure tasks specific to XML:

Download library artifact
Unarchive and move files to correct locations (Xerces, Perl)
Copy templated config files to correct location as Jinja templates (.j2)
Copy deployment script to user home for use in deployment at build time
Clean up build files