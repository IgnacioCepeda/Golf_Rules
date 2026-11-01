"use client"

import Image from "next/image"
import * as React from "react"
import { ChevronDownIcon, ExternalLinkIcon } from "lucide-react"

const usgaRulesUrl = "https://www.usga.org/rules/rules-and-clarifications/rules-and-clarifications.html"

const topics = [
  {
    title: "Jugar la bola como reposa",
    rule: "Regla 1",
    image: "/rules/bases-y-dropear/jugar-como-reposa.png",
    text: "El principio inicial es jugar el campo como se encuentra y la bola como reposa. No se mejora la posición de la bola, el área del stance, el swing previsto o la línea de juego, salvo que una Regla permita hacerlo.",
  },
  {
    title: "En caso de duda",
    rule: "Regla 20.1c(3)",
    image: "/rules/bases-y-dropear/caso-de-duda.png",
    text: "En juego por golpes, si tienes duda sobre el procedimiento correcto, puedes jugar dos bolas y pedir una decisión antes de entregar la tarjeta. Debes anunciar qué bola quieres que cuente si las Reglas permiten escoger, antes de jugarla.",
  },
  {
    title: "Embocar la bola y usar la misma bola",
    rule: "Reglas 3.3c y 6.3",
    image: "/rules/bases-y-dropear/embocar-y-bola.png",
    text: "En juego por golpes debes completar el hoyo embocando, salvo que una Regla diga otra cosa. Se juega la misma bola desde el área de salida hasta embocarla, excepto cuando las Reglas permiten o exigen sustituirla.",
  },
  {
    title: "Bola dañada",
    rule: "Regla 4.2c",
    image: "/rules/bases-y-dropear/bola-danada.png",
    text: "Puedes sustituir una bola únicamente si es evidente que se ha cortado o rajado durante el hoyo. Un raspón, rayón o cambio de pintura no basta; si procede sustituirla, debes colocar otra bola en el punto original.",
  },
  {
    title: "Consejo y línea de juego",
    rule: "Regla 10.2a",
    image: "/rules/bases-y-dropear/consejo.png",
    text: "Puedes recibir información pública, como distancias o ubicación de obstáculos, pero no consejo que pueda influir en la elección de palo, golpe o forma de jugar. Antes de ejecutar un golpe, no debes colocar objetos ni tener ayuda prohibida para apuntar.",
  },
  {
    title: "Caddie",
    rule: "Regla 10.3",
    image: "/rules/bases-y-dropear/caddie.png",
    text: "Un caddie puede ayudar bajo las Reglas, pero el jugador es responsable de las acciones de su caddie. El caddie no puede estar deliberadamente en o cerca de una extensión de la línea de juego detrás de la bola mientras el jugador toma el stance.",
  },
  {
    title: "Practicar en el campo",
    rule: "Reglas 5.2 y 5.5",
    image: "/rules/bases-y-dropear/practica.png",
    text: "Antes de una ronda, las posibilidades de práctica dependen del formato de juego. Durante una ronda no puedes hacer golpes de práctica mientras juegas un hoyo; existen excepciones limitadas, por ejemplo practicar putt o chip cerca del green recién terminado.",
  },
  {
    title: "Interrupción del juego / tormenta",
    rule: "Regla 5.7",
    image: "/rules/bases-y-dropear/interrupcion.png",
    text: "Si el Comité suspende el juego por peligro inminente, debes detenerlo de inmediato. Cuando una bola está en juego, no la levantes salvo que las Reglas lo permitan; antes de reanudar, confirma la posición y el procedimiento aplicable.",
  },
  {
    title: "Dropear correctamente",
    rule: "Regla 14.3",
    image: "/rules/bases-y-dropear/dropear-correctamente.png",
    text: "Identifica el punto de referencia y el área de alivio de la Regla aplicable. El jugador debe soltar la bola recta hacia abajo desde la altura de la rodilla; debe tocar primero el terreno dentro del área de alivio (o la línea, cuando aplique) y quedar en reposo en el área.",
  },
  {
    title: "¿Cuándo volver a dropear?",
    rule: "Regla 14.3c",
    image: "/rules/bases-y-dropear/volver-a-dropear.png",
    text: "Si una bola fue dropeada correctamente pero queda en reposo fuera del área de alivio, debes dropear otra vez. Si el segundo dropaje correcto también queda fuera, coloca una bola en el punto donde tocó por primera vez el terreno en el segundo dropaje.",
  },
  {
    title: "Dropear en lugar equivocado",
    rule: "Regla 14.7",
    image: "/rules/bases-y-dropear/lugar-equivocado.png",
    text: "El área de alivio siempre se mide desde el punto de referencia que determine la Regla aplicable y no puede estar más cerca del hoyo cuando esa limitación aplique. Jugar desde un lugar equivocado puede implicar la penalización general y, en algunos casos, requiere corregir el error.",
  },
  {
    title: "Dropear de manera incorrecta",
    rule: "Regla 14.3b",
    image: "/rules/bases-y-dropear/dropeo-incorrecto.png",
    text: "Si la bola no fue soltada por el jugador, no cayó recta desde la altura de la rodilla o no tocó primero el terreno en el área requerida, el dropaje es incorrecto. Corrígelo antes de jugar; no hay límite de veces para repetir un dropaje incorrecto.",
  },
] as const

export function BasicsDroppingSection() {
  const [openTopic, setOpenTopic] = React.useState<string | null>(null)

  return (
    <section id="bases-y-dropear" className="scroll-mt-8 rounded-2xl border bg-card p-5 shadow-sm md:p-7">
      <p className="text-sm font-medium tracking-[0.18em] text-emerald-700 uppercase">Resolver en el campo</p>
      <div className="mt-2 flex flex-col gap-3 md:flex-row md:items-end md:justify-between">
        <div>
          <h2 className="text-2xl font-semibold tracking-tight">Bases y dropear</h2>
          <p className="mt-2 max-w-2xl text-sm leading-6 text-muted-foreground">Selecciona una situación para consultar la explicación, la ilustración del app original y la Regla correspondiente.</p>
        </div>
        <span className="text-sm text-muted-foreground">12 situaciones</span>
      </div>

      <div className="mt-6 divide-y rounded-xl border">
        {topics.map((topic, index) => {
          const isOpen = openTopic === topic.title
          return (
            <article key={topic.title}>
              <button
                type="button"
                onClick={() => setOpenTopic(isOpen ? null : topic.title)}
                aria-expanded={isOpen}
                className="flex w-full items-center gap-4 p-4 text-left transition hover:bg-emerald-50 focus-visible:ring-2 focus-visible:ring-emerald-600 focus-visible:outline-none"
              >
                <span className="flex size-8 shrink-0 items-center justify-center rounded-full bg-emerald-950 text-xs font-semibold text-white">{String(index + 1).padStart(2, "0")}</span>
                <span className="min-w-0 flex-1">
                  <span className="block font-semibold">{topic.title}</span>
                  <span className="mt-0.5 block text-sm text-muted-foreground">{topic.rule}</span>
                </span>
                <ChevronDownIcon className={`size-5 shrink-0 text-emerald-800 transition-transform ${isOpen ? "rotate-180" : ""}`} />
              </button>
              {isOpen ? (
                <div className="grid gap-5 border-t bg-emerald-50/60 p-4 md:grid-cols-[200px_1fr] md:p-6">
                  <div className="relative aspect-square overflow-hidden rounded-xl border bg-white">
                    <Image src={topic.image} alt={`Ilustración: ${topic.title}`} fill sizes="(min-width: 768px) 200px, 100vw" className="object-contain p-2" />
                  </div>
                  <div className="flex flex-col justify-center">
                    <p className="text-sm leading-7 text-foreground">{topic.text}</p>
                    <a href={usgaRulesUrl} target="_blank" rel="noreferrer" className="mt-4 inline-flex w-fit items-center gap-2 text-sm font-semibold text-emerald-800 hover:text-emerald-600">Consultar {topic.rule} en USGA <ExternalLinkIcon className="size-4" /></a>
                  </div>
                </div>
              ) : null}
            </article>
          )
        })}
      </div>
    </section>
  )
}
