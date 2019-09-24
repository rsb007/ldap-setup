#!/bin/bash -e
docker run --name ldap-service --hostname ldap-service --env LDAP_ORGANISATION="test Pvt. Ltd." --env LDAP_DOMAIN="springframework.org" -p 389:389 -p 636:636 --detach osixia/openldap:1.1.8

docker run -p 6443:443 -p 6080:80 --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach osixia/phpldapadmin:0.7.2

# PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" phpldapadmin-service)

# echo "Go to: https://localhost:6080"
echo "Go to: https://localhost:6443"
echo "Login DN: cn=admin,dc=springframework,dc=org"
echo "Password: admin"

# (&(objectClass=inetOrgPerson)(memberOf=cn=users,ou=groups,dc=company,dc=com))
