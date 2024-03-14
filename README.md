# DashOffice

Example of application that creates an encapsuled DASH and a nginx sidecar that will handle a basic authentication.

# Rationale

The idea behind this example is to show several aspects:
* The application is based on Dash which uses Flask behind the hood;
* The Docker container used on this example make use of a `depends_on` feature with a healthcheck which is useful for not showing errors;
* nginx configured with `site.conf` that points to Dash container;

# Creating a htpasswd file

In order to create a `htpasswd` file, please run the following command:

* For the first time, inside `src/dashoffice`:

    $ htpasswd -c htpasswd <user_you_want_to_create>

* Second time onwards:

    $ htpasswd htpasswd <user_you_want_to_create>

# Building app

    $ docker compose build

# Running

    $ docker compose up

Point your browser to `http://localhost`. Yeah, it's listening on 80.

