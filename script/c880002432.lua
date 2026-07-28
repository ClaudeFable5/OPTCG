-- AUTO-GENERATED: EB04-011 / 우로코
-- rules_id=EB04-011 script_id=880002432 fingerprint=522b8ee8f443d6f9dd981119092a8878290b1deed99fc1538570fab6ef1cbf2b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[ALLOW_ATTACK_CHARACTER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【속공: 캐릭터】(이 카드는 등장한 턴에 캐릭터에게 어택할 수 있다.)]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount_per=1,
            filter={
              trait=[[해왕류]],
            },
            op=[[DRAW_PER_COUNT]],
            player=[[YOU]],
            then_discard_drawn=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 《해왕류》 특징을 가진 캐릭터 1장당, 카드를 1장 뽑는다. 그 후, 뽑은 수만큼 자신의 패를 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-011]],
    schema_version=1,
  })
end
