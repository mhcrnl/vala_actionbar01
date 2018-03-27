/*
  The ActionBar container is often placed below the content of the window,  and is used to show contextual actions.
  
    AUTHOR:     Mihai Cornel mhcrnl@gmail.com
    DATE:       26.03.2018
    COMPILE:    $valac --pkg gtk+-3.0 actionbar.vala
    RUN:        $./actionbar   
 
**/

using Gtk;

public class Example : Window
{
    public Example()
    {
    
        string[] authors = {"Mihai Cornel", "mhcrnl@gmail.com"};
        //var window = new Window(); #ref this
        
        this.title = "ActionBar";
        this.set_default_size(800, 600);
        this.destroy.connect(Gtk.main_quit);

        var grid = new Grid();
        grid.set_row_spacing(5);
        grid.set_column_spacing(5);
        this.add(grid);

        var label = new Label("");
        label.set_vexpand(true);
        grid.attach(label, 0, 0, 1, 1);

        var actionbar = new ActionBar();
        actionbar.set_hexpand(true);
        grid.attach(actionbar, 0, 1, 1, 1);

        var button1 = new Button.with_label("Cut");
        actionbar.pack_start(button1);
        var button2 = new Button.with_label("Copy");
        actionbar.pack_start(button2);
        var button3 = new Button.with_label("Paste");
        actionbar.pack_end(button3);
        /*CLOSE BUTTON*/
        var button4 = new Button.with_label("Close");
        button4.clicked.connect (() => {
            this.close();
        });
        actionbar.pack_end(button4);
        
/*BEGIN ABOUT BUTTON*/
        var btnAbout = new Button.with_label("About");
        btnAbout.clicked.connect(() => {
            // Use property names as keys
	        Gtk.show_about_dialog (this,
		        program_name: "SWMS",
		        copyright: "Copyright © 2018 Mihai Cornel",
		        authors: authors,
		        website: "http://en.wikipedia.org/wiki/Scrooge_McDuck",
		        website_label: "Scrooge McDuck and Co.");

        });
        actionbar.pack_end(btnAbout);
    }
/*END ABOUT BUTTON*/

    public static int main(string[] args)
    {
        Gtk.init(ref args);

        var window = new Example();
        
        window.show_all();

        Gtk.main();

        return 0;
    }
}
