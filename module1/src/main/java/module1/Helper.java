package module1;

import java.io.IOException;
import java.net.URL;
import java.util.Enumeration;
import java.util.Properties;
import java.util.TreeMap;

import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.google.common.collect.Iterables;

public class Helper {

    public static final String FACTORIES_RESOURCE_LOCATION = "META-INF/generator.factories";

    public static String getProcessorClassName( ClassLoader classLoader ) {
        TreeMap<Integer, String> map = new TreeMap<>( );
        try {
            Enumeration<URL> urls = ( classLoader != null ? classLoader.getResources( FACTORIES_RESOURCE_LOCATION )
                    : ClassLoader.getSystemResources( FACTORIES_RESOURCE_LOCATION ) );
            while ( urls.hasMoreElements( ) ) {
                URL url = urls.nextElement( );
                Properties properties = PropertiesLoaderUtils.loadProperties( new UrlResource( url ) );
                String generatorClassName = properties.getProperty( "generator.class" );
                String generatorClassOrder = properties.getProperty( "generator.order" );
                map.put( Integer.valueOf( generatorClassOrder ), generatorClassName );
            }
            return Iterables.getLast( map.values( ) );
        } catch ( IOException ex ) {
            throw new IllegalArgumentException( "Unable to load processor from location [" + FACTORIES_RESOURCE_LOCATION + "]",
                    ex );
        }
    }
}
