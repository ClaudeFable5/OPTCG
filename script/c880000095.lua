-- AUTO-GENERATED: EB02-033 / 클라바우터만
-- rules_id=EB02-033 script_id=880000095 fingerprint=5337ae4da2b0c11945c7f25e782966a5347d1d66023d9900bad2adf822c777b7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              name=[[고잉 메리 호]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신 필드에 「고잉 메리 호」가 있을 경우, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-033]],
    schema_version=1,
  })
end
