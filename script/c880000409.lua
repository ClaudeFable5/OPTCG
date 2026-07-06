-- AUTO-GENERATED: OP03-043 / 가이몬
-- rules_id=OP03-043 script_id=880000409 fingerprint=4bc178702e000521bbc5a21282c089e92f293d58eab3e3fbc3bfb92a5a6bae41
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
          {
            op=[[TRASH]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[상대의 라이프에 대미지를 주었을 때, 자신의 덱 위에서 3장을 트래시에 놓을 수 있다. 이 경우, 이 캐릭터를 트래시에 놓는다.]],
        timings={
          [[ON_DAMAGE_TO_OPPONENT_LIFE]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-043]],
    schema_version=1,
  })
end
