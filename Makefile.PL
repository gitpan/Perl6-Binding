use 5.006;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Perl6::Binding',
    'VERSION_FROM'	=> 'Binding.pm', # finds $VERSION
    'PREREQ_PM'		=> { 'PadWalker' => 0.08, 
    			     'Filter::Util::Call' => 1.06,
    			     'Text::Balanced' => 1.89,
    			   },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Binding.pm', # retrieve abstract from module
       AUTHOR     => 'Kevin Michael Vail <kevin@vaildc.net>') : ()),
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # 'OBJECT'		=> '$(O_FILES)', # link all the C files too
);
