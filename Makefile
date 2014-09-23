all: Test

Test: Test.vala
	valac -X -lgscgi-1.0 -X -L/usr/share/lib --pkg gio-2.0 /usr/share/vala/vapi/libgscgi-1.0.vapi Test.vala HTTPConstants.vala -o VeronicaFXTest

clean:
	rm -rf VeronicaFXTest
