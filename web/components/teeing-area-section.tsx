"use client"

import Image from "next/image"
import * as React from "react"
import { ChevronDownIcon, ExternalLinkIcon } from "lucide-react"

const usgaRulesUrl = "https://www.usga.org/rules/rules-and-clarifications/rules-and-clarifications.html"

const topics = [
  { title: "Preparativos y retraso", rule: "Reglas 5.3a y 5.6a", image: "/rules/realistas/preparativos-salida-realista.jpg", description: "Llega listo a tu hora de salida y revisa las reglas locales. El Comité puede penalizar la llegada tardía o el retraso irrazonable; juega a un ritmo ágil sin apresurar indebidamente a los demás." },
  { title: "Máximo 14 palos", rule: "Regla 4.1b", image: "/rules/realistas/maximo-14-palos-realista.jpg", description: "No puedes iniciar ni jugar una vuelta con más de 14 palos. Si descubres el exceso, declara de inmediato los palos fuera de juego; en juego por golpes la penalización se limita a cuatro golpes por vuelta." },
  { title: "Honor y orden de juego", rule: "Regla 6.4", image: "/rules/realistas/orden-juego-salida-realista.jpg", description: "En el primer hoyo se juega según el orden de salida; después, normalmente sale primero quien hizo el resultado más bajo en el hoyo anterior. En juego por golpes se permite jugar fuera de turno de forma segura y sin acuerdo para ayudar a alguien." },
  { title: "Consejo y línea de juego", rule: "Regla 10.2", image: "/rules/realistas/consejo-distancia-salida-realista.jpg", description: "No des ni pidas consejo sobre cómo jugar el hoyo. Puedes compartir información pública, como distancias, y tu caddie puede darte consejo; tampoco se permite colocar un objeto para señalar la línea de juego." },
  { title: "Practicar chip y putt", rule: "Regla 5.5a", image: "/rules/realistas/practicar-chip-realista-v2.jpg", description: "Mientras esperas para comenzar un hoyo, puedes practicar putting o chipping en o cerca del área de salida del siguiente hoyo. Hazlo sin demorar el juego y respetando cualquier restricción de las reglas locales." },
  { title: "El área de salida", rule: "Regla 6.2b", image: "/rules/realistas/area-de-salida-realista.jpg", description: "El área de salida es un rectángulo de dos palos de profundidad: el frente y los lados los definen los bordes exteriores de las dos marcas. La bola está dentro si cualquier parte de ella toca o está sobre el área; tú puedes colocarte fuera de ella." },
  { title: "Marcas del área de salida", rule: "Regla 6.2b(2)", image: "/rules/realistas/marcas-salida-realista.jpg", description: "Las marcas que delimitan el área de salida están fijas. No las muevas; sí puedes usar un tee, crear o eliminar irregularidades de la superficie y quitar arena, tierra, rocío, agua o escarcha en el área de salida." },
  { title: "Quitar impedimentos y obstrucciones", rule: "Reglas 8.1, 15.1 y 15.2", image: "/rules/realistas/impedimento-suelto-salida-realista.jpg", description: "En el área de salida puedes mejorar las condiciones que afectan el golpe, dentro de los límites de la Regla 8. También puedes quitar impedimentos sueltos y obstrucciones movibles; confirma que no haya una regla local que limite el procedimiento." },
  { title: "La bola se cae del tee", rule: "Regla 6.2b(5)", image: "/rules/realistas/bola-cae-tee-realista.jpg", description: "Si la bola se cae del tee o es movida accidentalmente antes de que hagas un golpe, no está en juego: puedes volver a colocarla en el tee sin penalización." },
  { title: "Golpe al aire", rule: "Definición de golpe", image: "/rules/realistas/golpe-aire-realista.jpg", description: "Si intentaste golpear la bola y fallaste, es un golpe y cuenta. Si, durante el downswing o detrás de la bola, detienes voluntariamente el palo antes de tocarla, no hay golpe." },
  { title: "Jugar fuera de turno", rule: "Regla 6.4", image: "/rules/realistas/fuera-turno-salida-realista.jpg", description: "En juego por golpes no hay penalización por jugar fuera de turno, salvo que dos jugadores acuerden hacerlo para ayudar a uno de ellos. En match play, el contrario puede cancelar el golpe y exigir que juegues en el orden correcto." },
  { title: "Jugar fuera del área de salida", rule: "Regla 6.1b", image: "/rules/realistas/fuera-area-salida-realista.jpg", description: "En juego por golpes, jugar desde fuera del área de salida implica dos golpes de penalización y debes corregir el error desde dentro antes de iniciar el hoyo siguiente. En match play no hay penalización, pero el contrario puede cancelar el golpe." },
  { title: "Salir desde las marcas equivocadas", rule: "Reglas 6.1b y 6.2b", image: "/rules/realistas/marcas-equivocadas-realista.jpg", description: "Juega desde el área de salida establecida para tu competición. Si la bola se juega desde fuera de esa área, aplica el procedimiento de la Regla 6.1b; si tienes duda sobre las marcas en uso, consulta al Comité antes de jugar." },
  { title: "Bola perdida o provisional", rule: "Regla 18.3", image: "/rules/realistas/bola-provisional-realista.jpg", description: "Si tu bola puede estar perdida fuera de un área de penalización o fuera de límites, anuncia claramente que jugarás una provisional antes del golpe. No se permite provisional cuando la única posibilidad es que esté en un área de penalización." },
] as const

export function TeeingAreaSection() {
  const [openTopic, setOpenTopic] = React.useState<string>("")

  return (
    <section id="mesa-de-salida" className="scroll-mt-8 rounded-2xl border bg-card p-5 shadow-sm md:p-7">
      <div className="flex flex-col justify-between gap-3 md:flex-row md:items-end">
        <div>
          <p className="text-sm font-medium tracking-[0.18em] text-emerald-700 uppercase">Resolver en el campo</p>
          <h2 className="mt-2 text-2xl font-semibold tracking-tight">Mesas de salida</h2>
          <p className="mt-2 max-w-2xl text-sm leading-6 text-muted-foreground">Antes de comenzar el hoyo, revisa la situación y aplica el procedimiento correcto.</p>
        </div>
        <span className="text-sm text-muted-foreground">14 situaciones</span>
      </div>

      <div className="mt-6 divide-y overflow-hidden rounded-xl border">
        {topics.map((topic, index) => {
          const isOpen = openTopic === topic.title
          return (
            <article key={topic.title} className="bg-background">
              <button type="button" onClick={() => setOpenTopic(isOpen ? "" : topic.title)} aria-expanded={isOpen} className="flex w-full items-center gap-4 px-4 py-4 text-left transition hover:bg-emerald-50/70 focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-emerald-600 focus-visible:outline-none md:px-5">
                <span className="flex size-7 shrink-0 items-center justify-center rounded-full bg-emerald-100 text-xs font-semibold text-emerald-800">{String(index + 1).padStart(2, "0")}</span>
                <span className="min-w-0 flex-1"><span className="block font-semibold">{topic.title}</span><span className="mt-0.5 block text-sm text-muted-foreground">{topic.rule}</span></span>
                <ChevronDownIcon className={`size-5 shrink-0 text-emerald-700 transition-transform ${isOpen ? "rotate-180" : ""}`} />
              </button>
              {isOpen ? (
                <div className="grid gap-5 border-t bg-emerald-50/40 p-4 md:grid-cols-[minmax(220px,0.7fr)_1fr] md:p-5">
                  <div className="relative min-h-52 overflow-hidden rounded-lg border bg-white">
                    <Image src={topic.image} alt={`Ilustración: ${topic.title}`} fill sizes="(min-width: 768px) 35vw, 100vw" className="object-contain" />
                  </div>
                  <div className="flex flex-col justify-center">
                    <p className="text-base leading-7 text-foreground">{topic.description}</p>
                    <a href={usgaRulesUrl} target="_blank" rel="noreferrer" className="mt-5 inline-flex w-fit items-center gap-2 text-sm font-semibold text-emerald-800 hover:text-emerald-600">Consultar {topic.rule} en USGA <ExternalLinkIcon className="size-4" /></a>
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
