var select2 = function($el) {
  var url = $el.attr("data-url");

  var placeholder = $el.attr("placeholder");
  if(placeholder == undefined){
    placeholder = ""
  }

  $('.select2').select2({
    allowClear: true,
    theme: "bootstrap",
    placeholder: placeholder,
    width: 200,
    tags: true,
    createTag: function (params) {
      return {
        id: params.term,
        text: params.term,
        newOption: true
      }
    },
    ajax: {
      url: url,
      dataType: 'json',
      data: function (params) {
        var query = {
          search: params.term,
          type: 'public'
        }
        return query;
      },
      processResults : function (data) {
        return {
          results : data
        }
      },
    },
  });
}
