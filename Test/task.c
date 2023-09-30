#include <gtk/gtk.h>

// Function to check if a number is a palindrome
gboolean is_palindrome(int num) {
    int original = num;
    int reversed = 0;

    while (num > 0) {
        int remainder = num % 10;
        reversed = reversed * 10 + remainder;
        num /= 10;
    }

    return original == reversed;
}

// Function to check if a number is even
gboolean is_even(int num) {
    return num % 2 == 0;
}

// Function to check if a number is composite
gboolean is_composite(int num) {
    int divisor_count = 0;
    for (int i = 1; i <= num; i++) {
        if (num % i == 0) {
            divisor_count++;
        }
    }
    return divisor_count > 2;
}

// Function to handle the "Check" button click event
void check_number(GtkWidget *widget, gpointer data) {
    GtkWidget *entry = (GtkWidget *)data;
    const gchar *text = gtk_entry_get_text(GTK_ENTRY(entry));
    int input_number = atoi(text);

    GtkWidget *result_label = gtk_label_new(NULL);

    if (is_palindrome(input_number)) {
        gtk_label_set_text(GTK_LABEL(result_label), "Result: Palindrome");
    } else if (is_even(input_number)) {
        gtk_label_set_text(GTK_LABEL(result_label), "Result: Even");
    } else if (is_composite(input_number)) {
        gtk_label_set_text(GTK_LABEL(result_label), "Result: Composite");
    } else {
        gtk_label_set_text(GTK_LABEL(result_label), "Result: None");
    }

    gtk_widget_show(result_label);
}

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);

    GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Number Checker");
    gtk_container_set_border_width(GTK_CONTAINER(window), 10);

    GtkWidget *entry = gtk_entry_new();
    GtkWidget *check_button = gtk_button_new_with_label("Check");

    GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    gtk_box_pack_start(GTK_BOX(vbox), entry, TRUE, TRUE, 0);
    gtk_box_pack_start(GTK_BOX(vbox), check_button, TRUE, TRUE, 0);

    g_signal_connect(check_button, "clicked", G_CALLBACK(check_number), entry);

    gtk_container_add(GTK_CONTAINER(window), vbox);
    gtk_widget_show_all(window);

    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    gtk_main();

    return 0;
}
