package edu.training.news_portal.filters;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class SecurityFilterConfig {

    public static final Set<String> PUBLIC_COMMANDS;

    private SecurityFilterConfig() {

    }

    static {
        Set<String> cmds = new HashSet<>(Arrays.asList(
                "PAGE_REGISTRATION",
                "PAGE_CREATE_NEWS",
                "PAGE_EDIT_NEWS",
                "PAGE_USER_HOME",
                "PAGE_AUTH",
                "PAGE_MAIN",
                "DO_REGISTRATION",
                "DO_DELETE_NEWS",
                "DO_EDIT_NEWS",
                "DO_ADD_NEWS",
                "DO_AUTH",
                "NO_COMMAND"
        ));

        PUBLIC_COMMANDS = Collections.unmodifiableSet(cmds);
    }


}