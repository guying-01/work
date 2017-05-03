<#include "/common/common_var_definds.ftl" />
<#macro render>
<script type="text/javascript" src="${resources}/js/common/pager.js"></script>
<script type="text/javascript" src="${resources}/js/common/tab.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.dataTables.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/dt-operation-commons.js"></script>
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.blockUI.min.js"></script> 
<script type="text/javascript" src="${resources}/js/lib/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${resources}/js/lib/handlebars/handlebars-v2.0.0.js"></script>
<script type="text/javascript" src="${resources}/js/lib/plupload/moxie.js"></script>
<script type="text/javascript" src="${resources}/js/lib/plupload/plupload.dev.js"></script>

<script type="text/javascript" src="${resources}/js/lib/date/laydate.js"></script>

<script type="text/javascript">
    var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();
    function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
    $('document').ready(function () {
        var gy = new requestData(10);
        gy.getData();
    });

    var requestData = (function () {
        function requestData(length) {
            _classCallCheck(this, requestData);

            this.length = length;
        }

        _createClass(requestData, [{
            key: "getData",
            value: function getData() {
                this.mainAccountRequest();
                this.sonAccountRequest();
            }
        }, {
            key: "mainAccountRequest",
            value: function mainAccountRequest() {
                $.post('findMemberList1.ajax', { start: 0, length: this.length }, function (data) {
                    var dataG = data.data;
                    requestData.rangeTemplate('main-account', dataG);
                });
            }
        }, {
            key: "sonAccountRequest",
            value: function sonAccountRequest() {
                $.post('findMemberList2.ajax', { start: 0, length: this.length }, function (data) {
                    var dataG = data.data;
                    requestData.rangeTemplate('son-account', dataG);
                });
            }
        }], [{
            key: "rangeTemplate",
            value: function rangeTemplate(ele, data) {
                var template = Handlebars.compile($("#" + ele).html());
                var templateHtml = template(data);
                $("." + ele).html(templateHtml);
            }
        }]);

        return requestData;
    })();
</script>
</#macro>