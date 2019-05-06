package com.xh.blogs.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;
import javax.validation.constraints.NotNull;

/**
 * @Name AvatarVo
 * @Description
 * @Author wen
 * @Date 2019-05-05
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AvatarVo {

    @NotNull(message = "X坐标不能为空")
    @Range(min = 0, max = 220)
    private Float x;

    @NotNull(message = "Y坐标不能为空")
    @Range(min = 0, max = 230)
    private Float y;

    @NotNull(message = "图片宽度不能为空")
    @Range(min = 80, max = 300)
    private Float width;

    @NotNull(message = "图片高度不能为空")
    @Range(min = 80, max = 300)
    private Float height;

}
