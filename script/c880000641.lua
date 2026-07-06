-- AUTO-GENERATED: OP05-029 / 돈키호테 도플라밍고
-- rules_id=OP05-029 script_id=880000641 fingerprint=3013d6a4697ddca572ab6e043e1b5d74c566dae6df4bfb4c9d4d8a61da43856e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 상대의 코스트 6 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-029]],
    schema_version=1,
  })
end
