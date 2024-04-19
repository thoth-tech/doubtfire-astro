<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress db' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', '' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'fA47#xE}pL$u]S/~_N6B96[(cp)U6t~<0+LYV&tM-uwQ<Uj)IzI1x =aZZbk4m+Y' );
define( 'SECURE_AUTH_KEY',  'C|~9:B*8M_gaWy!q/75{y|!N@i,&op|{P,2De5k=KS)l5Y1G+;*U+:#gS!=QCaSw' );
define( 'LOGGED_IN_KEY',    'Lc+_p+3-xev{S+3B0W{ihUlrw>N )<vi#36g=35bPK<f7Oq7dl@x-9n[.ldVP>V!' );
define( 'NONCE_KEY',        '|Y=`(Nn:a36!As!=Xv`@1!eU;sR:-1%!}%SY7?,P|X? 8I@:BAljOR$e]#u?M85M' );
define( 'AUTH_SALT',        'r&S&70H0rn+UhP[f` q0Oam,P#h@l<h.%wQmyS~V.&EPwO*kM~FNR_IM5(su;D4r' );
define( 'SECURE_AUTH_SALT', 'tZA*=e4]]dm[`Iu]PBZ{s>a5f[+%_.`zX`.Wgi(X`Y-a/?2iVgXSnRR#s@/]mL{`' );
define( 'LOGGED_IN_SALT',   '<O[*_?`Li,#w9l5T@PUe<L[Wk+(63bU-h(QId`LM3adQ[2!-(o:(.H4px1=Xdq`J' );
define( 'NONCE_SALT',       '+o640t.e kCoHt{yrO]T@iWyym## reaV(STJk]&4Fpl&/1E1XZ:$?G@43OrQf#3' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
