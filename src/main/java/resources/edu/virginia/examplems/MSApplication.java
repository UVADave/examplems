package edu.virginia.examplems;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import edu.virginia.examplems.resources.ServiceResource;
import edu.virginia.examplems.health.MSHealthCheck;

public class MSApplication extends Application<MSConfiguration> {
    public static void main(String[] args) throws Exception {
        new MSApplication().run(args);
    }

    @Override
    public String getName() {
        return "hello-world";
    }

    @Override
    public void initialize(Bootstrap<MSConfiguration> bootstrap) {
        // nothing to do yet
    }

    @Override
    public void run(MSConfiguration configuration,
                    Environment environment) {
        final ServiceResource resource = new ServiceResource(
                configuration.getTemplate(),
                configuration.getDefaultName()
        );

        final MSHealthCheck healthCheck =
                new MSHealthCheck(configuration.getTemplate());
        environment.healthChecks().register("template", healthCheck);

        environment.jersey().register(resource);
    }

}