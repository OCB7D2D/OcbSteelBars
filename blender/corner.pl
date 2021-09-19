use strict;
use warnings;
use Math::Trig;

our $dx = 0.1;
our $dy = 1;
our $dz = 0.025;
our $radius = 0.02;

our $insetTopW = 0.04;
our $insetTopH = 0.00;
our $dentTopW = 0.004;
our $dentTopH = 0.008;

our $insetBottomW = 0.05;
our $insetBottomH = 0.00;
our $dentBottomW = 0.02;
our $dentBottomH = 0.03;

my $translateX = 0;
my $translateY = 0;
my $translateZ = 0;

my @faces;
my @verts;
my $scaleZ = 1;

sub addVertex {

	my $x = $_[0];
	my $y = $_[1];
	my $z = $_[2];

	push @verts, [
		($translateY+$y)*0.5,
		($translateZ+$z*$scaleZ)*0.5,
		($translateX+$x)*0.5-0.5+0.05,
	];

}

sub exportCube {

	my $x = $_[0];
	my $y = $_[1];
	my $z = $_[2];
	my $inner = $_[3];

	addVertex(-$x, -$y, +$z);
	addVertex(-$x, +$y, +$z);
	addVertex(+$x, +$y, +$z);
	if ($inner) {
		addVertex(+$x, -$y+$dx*2-$inner*2, +$z);
	} else {
		addVertex(+$x, -$y+$dx*2, +$z);
	}

}

sub exportCorner {

	my $x = $_[0];
	my $y = $_[1];
	my $z = $_[2];

	addVertex(-$x+2, -$y, +$z);
	addVertex(-$x+2, +$y-2+$dx*2, +$z);

}

my $foff = 0;

sub exportRect {
	my ($a, $b, $c, $d) = @_;
	push @faces, [$foff+$a, $foff+$b, $foff+$c, $foff+$d];
}

sub exportBar {

	exportCube($dx, $dy, -$dz);
	exportCube($dx, $dy, $dz);
	my $dxt = $dx; my $dxb = $dx;
	my $dyt = $dy; my $dyb = $dy;
	my $dzt = $dz; my $dzb = $dz;
	$dxt -= $insetTopW;
	$dyt -= $insetTopW;
	$dzt -= $insetTopH;
	$dxb -= $insetBottomW;
	$dyb -= $insetBottomW;
	$dzb -= $insetBottomH;
	exportCube($dxt, $dyt, -$dzt, $insetTopW);
	exportCube($dxb, $dyb, $dzb, $insetBottomW);
	$dxt -= $dentTopW;
	$dyt -= $dentTopW;
	$dzt -= $dentTopH;
	$dxb -= $dentBottomW;
	$dyb -= $dentBottomW;
	$dzb -= $dentBottomH;
	exportCube($dxt, $dyt, -$dzt, $insetTopW + $dentTopW);
	exportCube($dxb, $dyb, $dzb, $insetBottomW + $dentBottomW);

	# export 3 side rects
	exportRect(2, 1, 5, 6);
	exportRect(7, 8, 4, 3);
	exportRect(3, 2, 6, 7);

	# export 3 rects on top
	exportRect(2, 1, 9, 10);
	exportRect(4, 3, 11, 12);
	exportRect(3, 2, 10, 11);
	# export 3 dent sides top
	exportRect(10, 9, 17, 18);
	exportRect(12, 11, 19, 20);
	exportRect(11, 10, 18, 19);
	# export dented area top
	exportRect(18, 17, 20, 19);

	# export 4 rects on bottom
	exportRect(2+4, 1+4, 9+4, 10+4);
	exportRect(4+4, 3+4, 11+4, 12+4);
	exportRect(3+4, 2+4, 10+4, 11+4);
	# export 4 dent sides bottom
	exportRect(10+4, 9+4, 17+4, 18+4);
	exportRect(12+4, 11+4, 19+4, 20+4);
	exportRect(11+4, 10+4, 18+4, 19+4);
	# export dented area bottom
	exportRect(18+4, 17+4, 20+4, 19+4);

}

sub exportBarRest {

	exportCorner($dx, $dy, -$dz);
	exportCorner($dx, $dy, $dz);
	my $dxt = $dx; my $dxb = $dx;
	my $dyt = $dy; my $dyb = $dy;
	my $dzt = $dz; my $dzb = $dz;
	$dxt += $insetTopW;
	$dyt -= $insetTopW;
	$dzt -= $insetTopH;
	$dxb += $insetBottomW;
	$dyb -= $insetBottomW;
	$dzb -= $insetBottomH;
	exportCorner($dxt, $dyt, -$dzt);
	exportCorner($dxb, $dyb, $dzb);
	$dxt += $dentTopW;
	$dyt -= $dentTopW;
	$dzt -= $dentTopH;
	$dxb += $dentBottomW;
	$dyb -= $dentBottomW;
	$dzb -= $dentBottomH;
	exportCorner($dxt, $dyt, -$dzt);
	exportCorner($dxb, $dyb, $dzb);


	# export 3 side rects
	exportRect(-23, -19, 3, 1);
	exportRect(3, 1, 2, 4);
	exportRect(2, 4, -16, -20);

	# export 3 rects on top
	exportRect(5, 6, 2, 1);
	exportRect(1, 5, -15, -23);
	exportRect(6, 2, -20, -12);
	# export 3 dent sides top
	exportRect(5, 6, 10, 9);
	exportRect(5, 9, -7, -15);
	exportRect(6, 10, -4, -12);
	# export dented area top
	exportRect(-7, 9, 10, -4);

	# export 3 rects on bottom
	exportRect(7, 8, 4, 3);
	exportRect(8, 4, -16, -8);
	exportRect(7, 3, -19, -11);
	# export 3 dent sides bottom
	exportRect(-8, 0, 12, 8);
	exportRect(12, 8, 7, 11);
	exportRect(7, 11, -3, -11);
	# export dented area bottom
	exportRect(0, 12, 11, -3);

}


sub exportBars {

	$translateX = 0;
	$translateY = 0;
	$translateZ = 1 - $dz;
	$scaleZ = -1;

	exportBar();
	$foff += 24;
	exportBarRest();
	$foff += 12;

	$translateX = 0;
	$translateY = 0;
	$translateZ = - 1 + $dz;
	$scaleZ = 1;

	exportBar();
	$foff += 24;
	exportBarRest();
	$foff += 12;

}

sub exportPole {

	for (my $i = 0; $i < 16; $i += 1) {
		my $phi = pi() / 8 * $i;
		my $x = cos($phi) * $radius;
		my $y = sin($phi) * $radius;
		addVertex($x, $y, +($dy - ($dz*2 - $dentBottomH)));
		addVertex($x, $y, -($dy - ($dz*2 - $dentBottomH)));
		$foff += 2;
		next if $i == 0;
		exportRect(-3, -2, 0, -1);
	}
	exportRect(-1, -0, -30, -31);

}

sub exportPoles {

	my $bn = 9;
	my $bw = (1 - $dx) / ($bn - 1);

	$translateZ = 0;
	$translateY = -1;
	$translateY += $dx;
	for (my $n = 0; $n < $bn; $n += 1) {
		exportPole();
		$translateY += $bw;
		$translateY += $bw;
	}

	$translateZ = 0;
	$translateY = -1 + $dx;
	$translateX = 0;
	for (my $n = 0; $n < $bn; $n += 1) {
		exportPole();
		$translateX += $bw;
		$translateX += $bw;
	}

}

exportBars();

print "g Bars\n";
print "o BarsMesh\n";

printf "v %g %g %g\n", @{$_} foreach @verts;
printf "f %g %g %g %g\n", @{$_} foreach @faces;

@verts = ();
@faces = ();

exportPoles();

print "g Poles\n";
print "o PolesMesh\n";

printf "v %g %g %g\n", @{$_} foreach @verts;
printf "f %g %g %g %g\n", @{$_} foreach @faces;