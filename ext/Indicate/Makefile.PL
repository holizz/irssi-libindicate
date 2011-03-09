use 5.010001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Indicate',
    VERSION_FROM      => 'lib/Indicate.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Indicate.pm', # retrieve abstract from module
       AUTHOR         => 'Tom Adams <holizz@>') : ()),
    LIBS              => ['-lgobject-2.0 -lindicate -ldbusmenu-glib'], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I. -I/usr/include/libindicate-0.5 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/libdbusmenu-0.4',
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
