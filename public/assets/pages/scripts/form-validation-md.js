var FormValidationMd = function() {

    var handleValidation1 = function() {
        // for more info visit the official plugin documentation:
        // http://docs.jquery.com/Plugins/Validation
        var form1 = $('#form_sample_1');
        var error1 = $('.alert-danger', form1);
        var success1 = $('.alert-success', form1);

        form1.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            messages: {
                payment: {
                    maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                    minlength: jQuery.validator.format("At least {0} items must be selected")
                },
                'checkboxes1[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                },
                'checkboxes2[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                }
            },
            rules: {
                name: {
                    minlength: 2,
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                email2: {
                    required: true,
                    email: true
                },
                url: {
                    required: true,
                    url: true
                },
                url2: {
                    required: true,
                    url: true
                },
                number: {
                    required: true,
                    number: true
                },
                number2: {
                    required: true,
                    number: true
                },
                digits: {
                    required: true,
                    digits: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                },
                delivery: {
                    required: true
                },
                payment: {
                    required: true,
                    minlength: 2,
                    maxlength: 4
                },
                memo: {
                    required: true,
                    minlength: 10,
                    maxlength: 40
                },
                'checkboxes1[]': {
                    required: true,
                    minlength: 2,
                },
                'checkboxes2[]': {
                    required: true,
                    minlength: 3,
                },
                radio1: {
                    required: true
                },
                radio2: {
                    required: true
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit
                success1.hide();
                error1.show();
                App.scrollTo(error1, -200);
            },

            errorPlacement: function(error, element) {
                if (element.is(':checkbox')) {
                    error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
                } else if (element.is(':radio')) {
                    error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function(element) { // revert the change done by hightlight
                $(element)
                    .closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label
                    .closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function(form) {
                success1.show();
                error1.hide();
            }
        });
    }

    var handleValidation2 = function() {
        // for more info visit the official plugin documentation:
        // http://docs.jquery.com/Plugins/Validation
        var form1 = $('#form_sample_2');
        var error1 = $('.alert-danger', form1);
        var success1 = $('.alert-success', form1);

        form1.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            messages: {
                payment: {
                    maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                    minlength: jQuery.validator.format("At least {0} items must be selected")
                },
                'checkboxes1[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                },
                'checkboxes2[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                }
            },
            rules: {
                name: {
                    minlength: 2,
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                email2: {
                    required: true,
                    email: true
                },
                url: {
                    required: true,
                    url: true
                },
                url2: {
                    required: true,
                    url: true
                },
                number: {
                    required: true,
                    number: true
                },
                number2: {
                    required: true,
                    number: true
                },
                digits: {
                    required: true,
                    digits: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                },
                delivery: {
                    required: true
                },
                payment: {
                    required: true,
                    minlength: 2,
                    maxlength: 4
                },
                memo: {
                    required: true,
                    minlength: 10,
                    maxlength: 40
                },
                'checkboxes1[]': {
                    required: true,
                    minlength: 2,
                },
                'checkboxes2[]': {
                    required: true,
                    minlength: 3,
                },
                radio1: {
                    required: true
                },
                radio2: {
                    required: true
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit
                success1.hide();
                error1.show();
                App.scrollTo(error1, -200);
            },

            errorPlacement: function(error, element) {
                if (element.is(':checkbox')) {
                    error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
                } else if (element.is(':radio')) {
                    error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function(element) { // revert the change done by hightlight
                $(element)
                    .closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label
                    .closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function(form) {
                success1.show();
                error1.hide();
            }
        });
    }

    var handleValidation3 = function() {
        // for more info visit the official plugin documentation:
        // http://docs.jquery.com/Plugins/Validation
        var form1 = $('#form_sample_3');
        var error1 = $('.alert-danger', form1);
        var success1 = $('.alert-success', form1);

        form1.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            messages: {
                payment: {
                    maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                    minlength: jQuery.validator.format("At least {0} items must be selected")
                },
                'checkboxes1[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                },
                'checkboxes2[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                }
            },
            rules: {
                name: {
                    minlength: 2,
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                email2: {
                    required: true,
                    email: true
                },
                url: {
                    required: true,
                    url: true
                },
                url2: {
                    required: true,
                    url: true
                },
                number: {
                    required: true,
                    number: true
                },
                number2: {
                    required: true,
                    number: true
                },
                digits: {
                    required: true,
                    digits: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                },
                delivery: {
                    required: true
                },
                payment: {
                    required: true,
                    minlength: 2,
                    maxlength: 4
                },
                memo: {
                    required: true,
                    minlength: 10,
                    maxlength: 40
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit
                success1.hide();
                error1.show();
                App.scrollTo(error1, -200);
            },

            errorPlacement: function(error, element) {
                if (element.is(':checkbox')) {
                    error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
                } else if (element.is(':radio')) {
                    error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function(element) { // revert the change done by hightlight
                $(element)
                    .closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label
                    .closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function(form) {
                success1.show();
                error1.hide();
            }
        });
    }

    var handleValidation_anetarsim = function() {
        // for more info visit the official plugin documentation:
        // http://docs.jquery.com/Plugins/Validation
        var form1 = $('#form_shto_anetare');
        var error1 = $('.alert-danger', form1);
        var success1 = $('.alert-success', form1);

        form1.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            messages: {
                payment: {
                    maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                    minlength: jQuery.validator.format("At least {0} items must be selected")
                },
                'checkboxes1[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                },
                'checkboxes2[]': {
                    required: 'Please check some options',
                    minlength: jQuery.validator.format("At least {0} items must be selected"),
                }
            },
            rules: {
                emri: {
                    minlength: 2,
                    required: true
                },
                atesia: {
                    minlength: 2,
                    required: true
                },
                mbiemri: {
                    minlength: 2,
                    required: true
                },
                gjinia: {
                    required: true
                },
                datelindja: {
                    required: true
                },
                kombesia: {
                    required: true
                },
                numri_ame: {
                    minlength: 13,
                    maxlength: 13,
                    digits: true,
                    required: true
                },
                civil: {
                    required: true
                },
                femijet: {
                    required: true,
                    number: true
                },
                adresa: {
                    required: true,
                    minlength: 8
                },
                komuna: {
                    required: true
                },
                tel_celular: {
                    required: true
                },
                tel_fiks: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                uck: {
                    required: true
                },
                prefesioni: {
                    required: true
                },
                arsimi: {
                    required: true
                },
                ars_drejtimi: {
                    required: '#arsimi_2:checked'
                },
                ars_fakulteti: {
                    required: '#arsimi_3:checked'
                },
                ars_titulli: {
                    required: '#arsimi_4:checked'
                },
                gjuha_1: {
                    required: {
                      depends: function(element) {
                        return $('input[name="gjuha_nje"]').val();
                      }
                    }
                },
                office: {
                    required: true
                },
                internet: {
                    required: true
                },
                punesimi: {
                    required: true
                },
                institucioni: {
                    required: '#punesimi_1[value="po"]:checked'
                },
                institucioni_adresa: {
                    required: '#punesimi_1[value="po"]:checked'
                },
                institucioni_pozita: {
                    required: '#punesimi_1[value="po"]:checked'
                },
                institucioni_data: {
                    required: '#punesimi_1[value="po"]:checked'
                },
                keshilla_drejtues: {
                    required: '#keshilla_drejtues[value="1"]:checked'
                },
                komisione: {
                    required: '#komisione[value="1"]:checked'
                },
                te_tjera: {
                    required: '#te_tjera[value="1"]:checked'
                },




                email: {
                    required: true,
                    email: true
                },
                email2: {
                    required: true,
                    email: true
                },
                url: {
                    required: true,
                    url: true
                },
                url2: {
                    required: true,
                    url: true
                },
                number: {
                    required: true,
                    number: true
                },
                number2: {
                    required: true,
                    number: true
                },
                digits: {
                    required: true,
                    digits: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                },
                delivery: {
                    required: true
                },
                payment: {
                    required: true,
                    minlength: 2,
                    maxlength: 4
                },
                memo: {
                    required: true,
                    minlength: 10,
                    maxlength: 40
                },
                'checkboxes1[]': {
                    required: true,
                    minlength: 2,
                },
                'checkboxes2[]': {
                    required: true,
                    minlength: 3,
                },
                radio1: {
                    required: true
                },
                radio2: {
                    required: true
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit
                success1.hide();
                error1.show();
                App.scrollTo(error1, -200);
            },

            errorPlacement: function(error, element) {
                if (element.is(':checkbox')) {
                    error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
                } else if (element.is(':radio')) {
                    error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function(element) { // revert the change done by hightlight
                $(element)
                    .closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label
                    .closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function(form) {
                success1.show();
                error1.hide();

                console.log("Submitted!");
                form.submit();
            }
        });
    }

    return {
        //main function to initiate the module
        init: function() {
            handleValidation1();
            handleValidation2();
            handleValidation3();
            handleValidation_anetarsim();
        }
    };
}();

jQuery(document).ready(function() {
    FormValidationMd.init();
    $(".btn.form_shto_anetare.reset").click(function() {
        $("#form_shto_anetare .form-actions").find("button, input[type='reset']").trigger("click");
    });
});
