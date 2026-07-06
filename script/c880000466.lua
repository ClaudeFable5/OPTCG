-- AUTO-GENERATED: OP03-100 / 킹 바움
-- rules_id=OP03-100 script_id=880000466 fingerprint=6f2113d2472a248fa64868b1aeb6e73082ace6bf6b197971a93cb24a4464d5e2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_LIFE_TOP]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 라이프 위나 아래에서 1장을 트래시에 놓을 수 있다: 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-100]],
    schema_version=1,
  })
end
