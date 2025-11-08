package edu.training.news_portal.web;

import edu.training.news_portal.web.impl.*;

import java.util.HashMap;
import java.util.Map;

public class CommandProvider {

    private final Map<RequestPath, Command> commands = new HashMap<>();

    public CommandProvider(){
        commands.put(RequestPath.PAGE_AUTH, new PageAuth());
        commands.put(RequestPath.PAGE_MAIN, new PageMain());
        commands.put(RequestPath.PAGE_REGISTRATION, new PageRegistration());
        commands.put(RequestPath.PAGE_USER_HOME, new PageUserHome());
        commands.put(RequestPath.DO_AUTH, new DoAuth());
        commands.put(RequestPath.DO_REGISTRATION, new DoRegistration());
        commands.put(RequestPath.NO_COMMAND, new NoCommand());
    }

    public Command take(String path){
        try {
            return commands.get(RequestPath.valueOf(path.toUpperCase()));
        }catch (IllegalArgumentException | NullPointerException e){
            return commands.get(RequestPath.NO_COMMAND);
        }
    }
}
