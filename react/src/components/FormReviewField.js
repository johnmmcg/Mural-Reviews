import React from 'react';

const FormReviewField = (props) => {
  return (
    <label onChange={props.onChange}>{props.label}
      <textarea
        name={props.name}
        type='text'
        value={props.content}
      />
    </label>
  );
}

export default FormReviewField;
