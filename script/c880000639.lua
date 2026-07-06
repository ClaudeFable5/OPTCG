-- AUTO-GENERATED: OP05-027 / 트라팔가 로
-- rules_id=OP05-027 script_id=880000639 fingerprint=1abc461e232d291bd436fc981e5c938459e654a516ad3495d6c5b6c6f1219926
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=3,
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
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 상대의 코스트 3 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-027]],
    schema_version=1,
  })
end
