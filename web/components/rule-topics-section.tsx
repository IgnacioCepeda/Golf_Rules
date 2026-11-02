"use client"

import Image from "next/image"
import * as React from "react"
import { ChevronDownIcon, ExternalLinkIcon } from "lucide-react"

import { FavoriteButton, favoriteId } from "@/components/favorite-button"

export type RuleTopic = { title: string; rule: string; image: string; description: string }

export function RuleTopicsSection({ title, intro, topics, sectionHref }: { title: string; intro: string; topics: readonly RuleTopic[]; sectionHref: string }) {
  const [openTopic, setOpenTopic] = React.useState<string>("")

  return (
    <section className="rounded-2xl border bg-card p-5 shadow-sm md:p-7">
      <div className="flex flex-col justify-between gap-3 md:flex-row md:items-end">
        <div>
          <p className="text-sm font-medium tracking-[0.18em] text-emerald-700 uppercase">Resolver en el campo</p>
          <h2 className="mt-2 text-2xl font-semibold tracking-tight">{title}</h2>
          <p className="mt-2 max-w-2xl text-sm leading-6 text-muted-foreground">{intro}</p>
        </div>
        <span className="text-sm text-muted-foreground">{topics.length} situaciones</span>
      </div>
      <div className="mt-6 divide-y overflow-hidden rounded-xl border">
        {topics.map((topic, index) => {
          const isOpen = openTopic === topic.title
          return <article key={topic.title} className="bg-background"><button type="button" onClick={() => setOpenTopic(isOpen ? "" : topic.title)} aria-expanded={isOpen} className="flex w-full items-center gap-4 px-4 py-4 text-left transition hover:bg-emerald-50/70 focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-emerald-600 focus-visible:outline-none md:px-5"><span className="flex size-7 shrink-0 items-center justify-center rounded-full bg-emerald-100 text-xs font-semibold text-emerald-800">{String(index + 1).padStart(2, "0")}</span><span className="min-w-0 flex-1"><span className="block font-semibold">{topic.title}</span><span className="mt-0.5 block text-sm text-muted-foreground">{topic.rule}</span></span><ChevronDownIcon className={`size-5 shrink-0 text-emerald-700 transition-transform ${isOpen ? "rotate-180" : ""}`} /></button>{isOpen ? <div className="grid gap-5 border-t bg-emerald-50/40 p-4 md:grid-cols-[minmax(220px,0.7fr)_1fr] md:p-5"><div className="relative min-h-52 overflow-hidden rounded-lg border bg-white"><Image src={topic.image} alt={`Ilustración: ${topic.title}`} fill sizes="(min-width: 768px) 35vw, 100vw" className="object-contain" /></div><div className="flex flex-col justify-center"><p className="text-base leading-7 text-foreground">{topic.description}</p><div className="mt-5 flex flex-wrap items-center gap-3"><a href="https://www.usga.org/rules/rules-and-clarifications/rules-and-clarifications.html" target="_blank" rel="noreferrer" className="inline-flex w-fit items-center gap-2 text-sm font-semibold text-emerald-800 hover:text-emerald-600">Consultar {topic.rule} en USGA <ExternalLinkIcon className="size-4" /></a><FavoriteButton favorite={{ ...topic, id: favoriteId(sectionHref, topic.title, topic.rule), section: title, sectionHref }} /></div></div></div> : null}</article>
        })}
      </div>
    </section>
  )
}
