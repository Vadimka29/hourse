CKEDITOR.plugins.add( 'customfileupload', {
    icons: 'customfileupload',
    init: function( editor ) {
        editor.addCommand('customfileupload',
            new CKEDITOR.dialogCommand('customfileupload'));

        editor.ui.addButton( 'customfileupload', {
            label: 'Insert clearfix',
            icon : this.path + 'icons/icon.png',
            command: 'customfileupload',
            toolbar: 'insert'
        });
            CKEDITOR.dialog.add('customfileupload', this.path + 'customfileupload/customfileupload.js');

    },
    title: 'Message For You',
    minWidth: CKEDITOR.env.ie ? 150 : 120,
    minHeight: 100,
    contents:[{
        id: 'dialog_plugin',
        expand: true,
        padding: 0,
        elements:
            [{
                type: 'html',
                html: '<p>' + 'This is the dialog plugin message :)'
                + '</p>'
            }]
    }]
});
