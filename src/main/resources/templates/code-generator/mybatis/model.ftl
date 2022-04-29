package ${packageName}.entity;

import java.io.Serializable;
import lombok.Data;
import java.util.Date;
import java.util.List;
import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * ${classInfo.classComment}
 * @author ${authorName} ${.now?string('yyyy-MM-dd')}
 */
@Data
public class ${classInfo.className} implements Serializable {

    private static final long serialVersionUID = 1L;
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >

    /**
     * ${fieldItem.columnName}  ${fieldItem.fieldComment}
     */
    <#if (fieldItem.fieldClass == 'Date')>
    @JSONField(name = "${fieldItem.fieldName}", format = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Shanghai")
    <#else/>
    @JSONField(name = "${fieldItem.fieldName}")
    </#if>
    @JsonProperty(value = "${fieldItem.fieldName}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};
</#list>
</#if>
}