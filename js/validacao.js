const formElement = document.querySelector("main section form")
console.log(formElement)

const validationInput = {
  "password": input => {
    if (input.value.trim().length > 4) {
      input.classList.remove("error")
      return true
    }

    input.classList.add("error")
    return false
  },

  "text": input => {
    if (input.value.trim().length > 0) {
      input.classList.remove("error")
      return true
    }

    input.classList.add("error")
    return false
  },

  "email": input => {
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    if (emailPattern.test(input.value.trim())) {
      input.classList.remove("error")
      return true
    }

    input.classList.add("error")
    return false
  }
}

const validationForm = e => {
  e.preventDefault()
  let isFormValid = true

  for (const field of formElement.elements) {
    if (validationInput[field.type]) {
      const isValid = validationInput[field.type](field)
      if (!isValid) isFormValid = false
    }
  }

  if (isFormValid) {
    console.log("Formulário enviado com sucesso!")
    formElement.submit()
  } else {
    console.log("Erro na validação do formulário.")
  }
}

formElement.addEventListener("submit", validationForm)