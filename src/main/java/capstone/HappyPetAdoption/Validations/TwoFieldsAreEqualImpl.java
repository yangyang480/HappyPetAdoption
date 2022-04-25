package capstone.HappyPetAdoption.Validations;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Slf4j
@Component
public class TwoFieldsAreEqualImpl implements ConstraintValidator<TwoFieldsAreEqual, Object> {

    private String fieldOneName;
    private String fieldTwoName;

    @Override
    public void initialize(TwoFieldsAreEqual constraintAnnotation) {
        fieldOneName = constraintAnnotation.fieldOneName();
        fieldTwoName = constraintAnnotation.fieldTwoName();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        if (value == null) {
            return true;
        }
        try {
            final String fieldOneValue = BeanUtils.getProperty(value, fieldOneName);
            final String fieldTwoValue = BeanUtils.getProperty(value, fieldTwoName);

            if (fieldOneValue == null && fieldTwoValue == null) {
                return true;
            }
            if (fieldOneValue.equals(fieldTwoValue)) {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }


}
